import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/base/error/error_object.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/local/get_local_user_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/local/save_local_user_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/local/update_local_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/get_local_user_bloodtarget_params.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/save_user_bloodtarget_params.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/update_blood_target_params.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/remote/save_remote_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/remote/update_remote_bloodtarget_usecase.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_target_state.dart';
part 'blood_target_cubit.freezed.dart';

class BloodTargetCubit extends Cubit<BloodTargetState> {
  BloodTargetCubit({
    required SaveLocalUserBloodTargetUseCase saveLocalUserBloodTargetUseCase,
    required GetLocalUserBloodTargetUseCase getLocalUserBloodTargetUseCase,
    required SaveRemoteBloodTargetUseCase saveRemoteBloodTargetUseCase,
    required UpdateRemoteBloodTargetUseCase updateRemoteBloodTargetUseCase,
    required UpdateLocalBloodTargetUseCase updateLocalBloodTargetUseCase,
  })  : _saveLocalUserBloodTargetUseCase = saveLocalUserBloodTargetUseCase,
        _getLocalUserBloodTargetUseCase = getLocalUserBloodTargetUseCase,
        _saveRemoteBloodTargetUseCase = saveRemoteBloodTargetUseCase,
        _updateRemoteBloodTargetUseCase = updateRemoteBloodTargetUseCase,
        _updateLocalBloodTargetUseCase = updateLocalBloodTargetUseCase,
        super(const BloodTargetState.initial());

  final SaveLocalUserBloodTargetUseCase _saveLocalUserBloodTargetUseCase;
  final GetLocalUserBloodTargetUseCase _getLocalUserBloodTargetUseCase;
  final SaveRemoteBloodTargetUseCase _saveRemoteBloodTargetUseCase;
  final UpdateRemoteBloodTargetUseCase _updateRemoteBloodTargetUseCase;
  final UpdateLocalBloodTargetUseCase _updateLocalBloodTargetUseCase;

  Future<void> getBloodTargetsOnUser() async {
    emit(const _Loading());

    final userBloodTarget = await _getLocalUserBloodTargetUseCase.call(
      GetLocalUserBloodTargetParams(
        userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
      ),
    );

    userBloodTarget.fold(
      (fail) {
        // emit(
        //   const _Failure(
        //     errorObject: ErrorObject(errorType: ErrorType.returnedNothing, errorMessage: "Kayıtlı kan şekeri hedefi bulunamadı"),
        //   ),
        // );
        emit(const _Initial());
      },
      (success) {
        emit(_Success(
          successMessage: "",
          userBloodTarget: success!,
        ));
      },
    );
  }

  Future<void> saveUserBloodTarget(String fbstValue, String ofbgtValue) async {
    emit(const _Loading());

    UserBloodTarget userBTToSave = UserBloodTarget(
      id: UniqueKey().hashCode,
      userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
      fbstValue: double.parse(fbstValue),
      ofbgtValue: double.parse(ofbgtValue),
    );

    await _saveLocalUserBloodTargetUseCase.call(SaveUserBloodTargetParams(userBloodTarget: userBTToSave));

    final remoteResponse = await _saveRemoteBloodTargetUseCase.call(SaveUserBloodTargetParams(userBloodTarget: userBTToSave));

    remoteResponse.fold(
      (failure) {
        emit(
          const _Failure(
            errorObject: ErrorObject(
              errorType: ErrorType.notLoggedIn,
              errorMessage: "Giriş yapmanız gerekiyor.",
            ),
          ),
        );
      },
      (success) {
        emit(
          _Success(
            successMessage: "Hedef kan şekeri değerleriniz başarıyla kaydedilmiştir.",
            userBloodTarget: userBTToSave,
          ),
        );
      },
    );
  }

  Future<void> updateBloodTarget(
    String? fbstValue,
    String? ofbgtValue,
    int? id,
  ) async {
    emit(const _Loading());

    UserBloodTarget userBTToSave = UserBloodTarget(
      id: id,
      userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
      fbstValue: double.parse(fbstValue!),
      ofbgtValue: double.parse(ofbgtValue!),
    );

    await _updateLocalBloodTargetUseCase.call(UpdateBloodTargetParams(userBloodTarget: userBTToSave));

    final updateResponse = await _updateRemoteBloodTargetUseCase.call(UpdateBloodTargetParams(userBloodTarget: userBTToSave));

    updateResponse.fold(
      (failure) {
        emit(
          const _Failure(
            errorObject: ErrorObject(errorType: ErrorType.notLoggedIn, errorMessage: "Giriş yapmanız gerekiyor."),
          ),
        );
      },
      (success) {
        emit(
          _Success(
            successMessage: "Hedef kan şekeri değerleriniz başarıyla güncellenmiştir.",
            userBloodTarget: userBTToSave,
          ),
        );
      },
    );
  }
}
