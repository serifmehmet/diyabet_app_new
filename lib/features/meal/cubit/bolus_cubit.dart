import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/get_local_user_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/get_local_user_bloodtarget_params.dart';
import 'package:diyabet_app/domain/usecases/user_idf/get_all_user_idf_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/get_all_user_idf_usecase_params.dart';
import 'package:diyabet_app/domain/usecases/user_iko/get_all_user_iko_list_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/get_all_user_iko_params.dart';
import 'package:diyabet_app/features/meal/widgets/bolus_calculation_modal_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bolus_state.dart';

class BolusCubit extends Cubit<BolusState> {
  BolusCubit({
    required GetAllUserIdfUseCase getAllUserIdfUseCase,
    required GetAllUserIkoListUseCase getAllUserIkoListUseCase,
    required GetLocalUserBloodTargetUseCase getLocalUserBloodTargetUseCase,
  })  : _getAllUserIdfUseCase = getAllUserIdfUseCase,
        _getAllUserIkoListUseCase = getAllUserIkoListUseCase,
        _getLocalUserBloodTargetUseCase = getLocalUserBloodTargetUseCase,
        super(BolusInitial());

  final GetAllUserIdfUseCase _getAllUserIdfUseCase;
  final GetAllUserIkoListUseCase _getAllUserIkoListUseCase;
  final GetLocalUserBloodTargetUseCase _getLocalUserBloodTargetUseCase;
  late double idfValue = 0;
  late double ikoValue = 0;
  late double targetValue = 0;
  late UserBloodTarget userBloodTarget;
  late int lastMealHour = 5;

  Future<void> listBolusInfo() async {
    double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
    TimeOfDay now = TimeOfDay.now();

    //IdfList
    final userIdfList =
        await _getAllUserIdfUseCase.call(GetAllUserIdfUseCaseParams(userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID)));
    final userIkoList =
        await _getAllUserIkoListUseCase.call(GetAllUserIkoListParams(userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID)));
    userBloodTarget =
        await _getLocalUserBloodTargetUseCase.call(GetLocalUserBloodTargetParams(userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID)));

    //Sort by hour
    userIdfList.sort((a, b) => a.hour!.compareTo(b.hour!));
    //Idf içinde dön
    for (var userIdf in userIdfList) {
      //DateTime'ı TimeOfDay'e çevir
      TimeOfDay incomingTime = TimeOfDay(hour: userIdf.hour!.hour, minute: userIdf.hour!.minute);

      var hour1 = toDouble(incomingTime);
      var hour2 = toDouble(now);

      if (hour1 <= hour2) {
        idfValue = userIdf.idfValue!;
      }
    }

    //Iko içinde dön
    for (var userIko in userIkoList) {
      TimeOfDay incomingTime = TimeOfDay(hour: userIko.hour!.hour, minute: userIko.hour!.minute);

      var hour1 = toDouble(incomingTime);
      var hour2 = toDouble(now);

      if (hour1 <= hour2) {
        ikoValue = userIko.ikoValue!;
      }
    }

    emit(BolusInfoLoaded(ikoValue: ikoValue, idfValue: idfValue, targetValue: userBloodTarget.fbstValue!, lastMealHour: lastMealHour));
  }

  void changeTargetType(int lastMealHour) {
    if (lastMealHour == 5) {
      emit(BolusInfoLoaded(idfValue: idfValue, ikoValue: ikoValue, targetValue: userBloodTarget.fbstValue!, lastMealHour: lastMealHour));
      return;
    }
    emit(BolusInfoLoaded(idfValue: idfValue, ikoValue: ikoValue, targetValue: targetValue, lastMealHour: lastMealHour));
  }

  void calculateBolus(int lastMealHour, double totalCarb, int mealId, {double? instantBloodSugarValue}) {
    double result;
    double correctionDoze;
    double calculatedInsulinDoze;
    //3+
    if (lastMealHour == 5) {
      correctionDoze = (instantBloodSugarValue! - userBloodTarget.fbstValue!) / idfValue;
      calculatedInsulinDoze = totalCarb / ikoValue;
      result = correctionDoze + calculatedInsulinDoze;
    } else if (lastMealHour == 4 || lastMealHour == 3) {
      correctionDoze = (instantBloodSugarValue! - 160) / idfValue;
      calculatedInsulinDoze = totalCarb / ikoValue;
      result = correctionDoze + calculatedInsulinDoze;
    } else {
      result = totalCarb / ikoValue;
    }

    emit(BolusCalculated(resultValue: result, isCalculated: true, calculatedMealId: mealId));
  }
}
