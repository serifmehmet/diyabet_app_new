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

    emit(BolusInfoLoaded(ikoValue: ikoValue, idfValue: idfValue, targetType: TargetType.fasting, targetValue: userBloodTarget.fbstValue!));

    //now = 17.10
  }

  void changeTargetType(TargetType targetType) {
    if (targetType == TargetType.fasting) {
      emit(BolusInfoLoaded(targetType: TargetType.fasting, targetValue: userBloodTarget.fbstValue!, idfValue: idfValue, ikoValue: ikoValue));
    } else if (targetType == TargetType.satiety) {
      emit(BolusInfoLoaded(targetType: TargetType.satiety, targetValue: userBloodTarget.pbgtValue!, idfValue: idfValue, ikoValue: ikoValue));
    } else {
      emit(BolusInfoLoaded(targetType: TargetType.overnight, targetValue: userBloodTarget.ofbgtValue!, idfValue: idfValue, ikoValue: ikoValue));
    }
  }
}
