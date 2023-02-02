import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/local/get_local_user_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/get_local_user_bloodtarget_params.dart';
import 'package:diyabet_app/domain/usecases/user_bolus/params/save_calculated_userbolus_params.dart';
import 'package:diyabet_app/domain/usecases/user_bolus/save_calculated_userbolus_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/local/get_all_user_idf_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/get_all_user_idf_usecase_params.dart';
import 'package:diyabet_app/domain/usecases/user_iko/local/get_all_user_iko_list_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/get_all_user_iko_params.dart';
import 'package:diyabet_app/features/meal/widgets/bolus_calculation_modal_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_bolus.dart';

part 'bolus_state.dart';

class BolusCubit extends Cubit<BolusState> {
  BolusCubit({
    required GetAllUserIdfUseCase getAllUserIdfUseCase,
    required GetAllUserIkoListUseCase getAllUserIkoListUseCase,
    required GetLocalUserBloodTargetUseCase getLocalUserBloodTargetUseCase,
    required SaveCalculatedUserBolusUsecase saveCalculatedUserBolusUsecase,
  })  : _getAllUserIdfUseCase = getAllUserIdfUseCase,
        _getAllUserIkoListUseCase = getAllUserIkoListUseCase,
        _getLocalUserBloodTargetUseCase = getLocalUserBloodTargetUseCase,
        _saveCalculatedUserBolusUsecase = saveCalculatedUserBolusUsecase,
        super(BolusInitial());

  final GetAllUserIdfUseCase _getAllUserIdfUseCase;
  final GetAllUserIkoListUseCase _getAllUserIkoListUseCase;
  final GetLocalUserBloodTargetUseCase _getLocalUserBloodTargetUseCase;
  final SaveCalculatedUserBolusUsecase _saveCalculatedUserBolusUsecase;
  late double idfValue = 0;
  late double ikoValue = 0;
  late double targetValue = 0;
  late UserBloodTarget? userBloodTarget;
  late int lastMealHour = 5;
  late double calculatedBolusValue = 0;

  Future<void> checkIdfValue() async {
    final userIdfList =
        await _getAllUserIdfUseCase.call(GetAllUserIdfUseCaseParams(userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID)));

    if (userIdfList.isEmpty) {
      emit(
        const UserIdfListEmpty(emptyIdfMessage: "IDF Bilgileri bulunamadı."),
      );
    }
  }

  Future<void> listBolusInfo() async {
    double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
    TimeOfDay now = TimeOfDay.now();

    //IdfList
    final userIdfList =
        await _getAllUserIdfUseCase.call(GetAllUserIdfUseCaseParams(userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID)));

    if (userIdfList.isEmpty) {
      emit(const UserIdfListEmpty(emptyIdfMessage: "IDF Bilgileri bulunamadı."));
      return;
    }

    final userIkoList =
        await _getAllUserIkoListUseCase.call(GetAllUserIkoListParams(userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID)));
    final userBloodTargetFromLocal =
        await _getLocalUserBloodTargetUseCase.call(GetLocalUserBloodTargetParams(userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID)));
    userBloodTargetFromLocal.fold((l) => null, (r) {
      userBloodTarget = r;
    });
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

    emit(BolusInfoLoaded(ikoValue: ikoValue, idfValue: idfValue, targetValue: userBloodTarget!.fbstValue!, lastMealHour: lastMealHour));
  }

  void changeTargetType(int lastMealHour) {
    if (lastMealHour == 5) {
      emit(BolusInfoLoaded(idfValue: idfValue, ikoValue: ikoValue, targetValue: userBloodTarget!.fbstValue!, lastMealHour: lastMealHour));
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
      correctionDoze = (instantBloodSugarValue! - userBloodTarget!.fbstValue!) / idfValue;
      calculatedInsulinDoze = totalCarb / ikoValue;
      calculatedBolusValue = correctionDoze + calculatedInsulinDoze;
    } else if (lastMealHour == 4 || lastMealHour == 3) {
      correctionDoze = (instantBloodSugarValue! - 160) / idfValue;
      calculatedInsulinDoze = totalCarb / ikoValue;
      calculatedBolusValue = correctionDoze + calculatedInsulinDoze;
    } else {
      calculatedBolusValue = totalCarb / ikoValue;
    }

    emit(BolusCalculated(resultValue: calculatedBolusValue));

    saveCalculatedBolus(totalCarb, mealId);
  }

  void saveCalculatedBolus(double totalCarbValue, int mealId) async {
    emit(CalculatedBolusSaving());
    try {
      UserBolus userBolus = UserBolus(
        id: 0,
        userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        totalCarbValue: totalCarbValue,
        calculatedBolusValue: calculatedBolusValue,
        calculatedTime: DateTime.now(),
      );
      final response = await _saveCalculatedUserBolusUsecase.call(SaveCalculatedUserBolusParams(userBolus: userBolus, mealId: mealId));

      if (response.errorCode == "OK") {
        emit(CalculatedBolusSaved(
            successMessage: "Hesaplamanız başarıyla kaydedilmiştir.", calculatedBolusValue: calculatedBolusValue, calculatedMealId: mealId));
      } else {
        emit(const CalculatedBolusSaveError(failureMessage: "Hesaplama kaydedilirken bir problem oluştu."));
      }
    } catch (e) {
      emit(CalculatedBolusSaveError(failureMessage: e.toString()));
    }
  }
}
