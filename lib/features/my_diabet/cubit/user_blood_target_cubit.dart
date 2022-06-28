import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/get_local_user_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/get_local_user_bloodtarget_params.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/save_local_user_bloodtarget_params.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/save_local_user_bloodtarget_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_blood_target_state.dart';

class UserBloodTargetCubit extends Cubit<UserBloodTargetState> {
  UserBloodTargetCubit({
    required this.saveLocalUserBloodTargetUseCase,
    required this.getLocalUserBloodTargetUseCase,
  }) : super(UserBloodTargetInitial());

  final SaveLocalUserBloodTargetUseCase saveLocalUserBloodTargetUseCase;
  final GetLocalUserBloodTargetUseCase getLocalUserBloodTargetUseCase;

  Future<void> saveUBT(String? fbstValue, String? pbgtValue, String? ofbgValue) async {
    try {
      emit(UserBloodTargetSaving());
      UserBloodTarget userBTToSave = UserBloodTarget(
        id: UniqueKey().hashCode,
        userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        fbstValue: double.parse(fbstValue!),
        pbgtValue: double.parse(pbgtValue!),
        ofbgtValue: double.parse(ofbgValue!),
      );

      await saveLocalUserBloodTargetUseCase.call(
        SaveLocalUserBloodTargetParams(userBloodTarget: userBTToSave),
      );

      emit(UserBloodTargetSaved());
    } catch (e) {
      emit(UserBloodTargetSaveFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getUserBT() async {
    try {
      final userBT = await getLocalUserBloodTargetUseCase.call(
        GetLocalUserBloodTargetParams(
          userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        ),
      );

      emit(UserBloodTargetLoaded(userBloodTarget: userBT));
    } catch (e) {
      emit(UserBloodTargetLoadFailure(errorMessage: e.toString()));
    }
  }
}
