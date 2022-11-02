import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/domain/usecases/user/params/update_user_info_params.dart';
import 'package:diyabet_app/domain/usecases/user/user_update_info_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required UserUpdateInfoUseCase userUpdateInfoUseCase})
      : _userUpdateInfoUseCase = userUpdateInfoUseCase,
        super(const ProfileState.initial());

  final UserUpdateInfoUseCase _userUpdateInfoUseCase;

  Future<void> updateUserInfo(String name, String surName, String password) async {
    emit(const ProfileState.loading());

    final userId = CacheManager.instance.getIntValue(PreferencesKeys.USERID);
    final res = await _userUpdateInfoUseCase.call(UpdateUserInfoParams(userId, name, surName, password));

    if (res.errorCode == "OK") {
      CacheManager.instance.setStringValue(PreferencesKeys.USER_NAME, "$name $surName");
      CacheManager.instance.setStringValue(PreferencesKeys.PASSWORD, password);
      emit(
        const ProfileUpdated(message: "Profil bilgileriniz başarıyla kaydedilmiştir."),
      );
    } else {
      emit(const ProfileUpdateError(errorMessage: "Profil bilgileriniz kaydedilirken bir hata oluştu"));
    }
  }
}
