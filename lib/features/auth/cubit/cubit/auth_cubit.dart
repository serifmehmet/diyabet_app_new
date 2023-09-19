import 'package:bloc/bloc.dart';
import 'package:diyabet_app/data/datasources/local/models/local_recipe_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/user_blood_target_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/user_idf_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/user_iko_hive_model.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:diyabet_app/domain/usecases/user/params/reset_user_password_params.dart';
import 'package:diyabet_app/domain/usecases/user/params/user_register_param.dart';
import 'package:diyabet_app/domain/usecases/user/reset_user_password_usecase.dart';
import 'package:diyabet_app/domain/usecases/user/user_register_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/save_user_bloodtarget_params.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/local/save_local_user_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/local/save_user_idf_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/save_user_idf_params.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/save_user_iko_params.dart';
import 'package:diyabet_app/domain/usecases/user_iko/local/save_local_user_iko_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants/enums/preferences_keys.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../core/init/usecase/usecase.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/entities/user_idf.dart';
import '../../../../domain/entities/user_iko.dart';
import '../../../../domain/usecases/cache_food/get_all_foods_for_cache.dart';
import '../../../../domain/usecases/user/params/user_login_param.dart';
import '../../../../domain/usecases/user/user_login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserLoginUseCase? userLoginUseCase;
  final UserRegisterUseCase? userRegisterUseCase;
  final GetAllFoodsForCache? getAllFoodsForCache;

  final SaveLocalUserIdfUseCase saveLocalUserIdfUseCase;
  final SaveLocalUserIkoUseCase saveLocalUserIkoUseCase;
  final SaveLocalUserBloodTargetUseCase saveLocalUserBloodTargetUseCase;

  final ResetUserPasswordUseCase resetUserPasswordUseCase;
  AuthCubit({
    this.userLoginUseCase,
    this.getAllFoodsForCache,
    this.userRegisterUseCase,
    required this.saveLocalUserIdfUseCase,
    required this.saveLocalUserIkoUseCase,
    required this.saveLocalUserBloodTargetUseCase,
    required this.resetUserPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    getAllFoodsForCache?.call(const NoParams());
    bool isSignIn = CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN);

    if (isSignIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

  late User _user;
  Future<void> logIn(String email, String password) async {
    emit(LoginInfoPosting());

    final response = await userLoginUseCase?.call(UserLoginParam(email, password));

    if (response != null) {
      if (response.ErrorCode == "OK") {
        _user = response;

        saveRemoteUserIdfToLocal(_user.userIdfList!);
        saveRemoteUserIkoToLocal(_user.userIkoList!);
        if (_user.userBloodTarget != null) {
          saveRemoteBloodTargetToLocal(_user.userBloodTarget!);
        }

        emit(LoginCompleted(_user));
        emit(Authenticated());

        CacheManager.instance.setBoolValue(PreferencesKeys.IS_LOGGEDIN, true);
        CacheManager.instance.setIntValue(PreferencesKeys.USERID, _user.UserId!);

        // CacheManager.instance.setStringValue(PreferencesKeys.USER_NAME, _user.Name!);

        CacheManager.instance.setStringValue(PreferencesKeys.X_SESSION_ID, _user.xSessionId!);
        CacheManager.instance.setStringValue(PreferencesKeys.USER_NAME, '${_user.Name!} ${_user.SurName!}');
        CacheManager.instance.setStringValue(PreferencesKeys.PASSWORD, password);

        NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
      } else if (response.ErrorCode == "E0010") {
        emit(const LoginFailure("Geçersiz kullanıcı adı veya şifre. Lütfen tekrar deneyiniz."));
      }
    } else {
      emit(const LoginFailure("Login olamadık"));
    }
  }

  Future<void> saveRemoteUserIdfToLocal(List<UserIdf>? userIdfList) async {
    if (userIdfList!.isNotEmpty) {
      for (var userIdf in userIdfList) {
        await saveLocalUserIdfUseCase.call(SaveUserIdfParams(userIdf: userIdf));
      }
    }
  }

  Future<void> saveRemoteUserIkoToLocal(List<UserIko>? userIkoList) async {
    if (userIkoList!.isNotEmpty) {
      for (var userIko in userIkoList) {
        await saveLocalUserIkoUseCase.call(SaveUserIkoParams(userIko: userIko));
      }
    }
  }

  Future<void> saveRemoteBloodTargetToLocal(UserBloodTarget? userBloodTarget) async {
    if (userBloodTarget != null) {
      await saveLocalUserBloodTargetUseCase.call(SaveUserBloodTargetParams(userBloodTarget: userBloodTarget));
    }
  }

  Future<bool> logOut() async {
    emit(UnAuthenticated());
    CacheManager.instance.setBoolValue(PreferencesKeys.IS_LOGGEDIN, false);
    CacheManager.instance.clearKey(PreferencesKeys.USERID);
    CacheManager.instance.clearKey(PreferencesKeys.USER_NAME);
    CacheManager.instance.clearKey(PreferencesKeys.PASSWORD);

    final idfBox = Hive.box<UserIdfHiveModel>(UserIdfHiveModel.boxKey);
    final ikoBox = Hive.box<UserIkoHiveModel>(UserIkoHiveModel.boxKey);
    final bloodBox = Hive.box<UserBloodTargetHiveModel>(UserBloodTargetHiveModel.boxKey);
    final recipeBox = Hive.box<LocalRecipeHiveModel>(LocalRecipeHiveModel.boxKey);
    bool deleted = false;

    await idfBox.clear().then((value) => deleted = true);
    await ikoBox.clear().then((value) => deleted = true);
    await bloodBox.clear().then((value) => deleted = true);
    await recipeBox.clear().then((value) => deleted = true);
    // await Hive.box(UserIkoHiveModel.boxKey).clear();
    // await Hive.box(UserBloodTargetHiveModel.boxKey).clear();

    // await Hive.box(LocalRecipeHiveModel.boxKey).clear();

    return deleted;
  }

  Future<void> checkAuthentication() async {
    bool isAuthenticated = CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN);

    if (isAuthenticated) {
      emit(Authenticated());
    } else {
      emit(NotAuthenticated());
    }
  }

  Future<void> userRegister(User? user) async {
    emit(UserRegistering());

    final response = await userRegisterUseCase?.call(UserRegisterParam(user: user));

    if (response!.errorCode == "OK") {
      CacheManager.instance.setBoolValue(PreferencesKeys.IS_FROM_REGISTER, true);
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
      emit(Registered());
    } else {
      emit(UserRegisterFailure(errorMessage: response.errorDescription));
    }
  }

  Future<void> userPasswordReset(String email, String password) async {
    emit(ResetPasswordLoading());

    final response = await resetUserPasswordUseCase.call(ResetUserPasswordParams(email: email, password: password));

    if (response.errorCode == "OK") {
      emit(const ResetPasswordSuccess(
          "Şifre yenileme talebiniz alınmıştır. E-Posta kutunuzu kontrol edin lütfen. Not: Şifre yenileme e-postası gelmediyse Spam kutunuzu da kontrol edin lütfen."));
    }

    if (response.errorCode == "E9998") {
      emit(const ResetPasswordError("Girdiğiniz E-Posta adresi sistemimizde kayıtlı değildir."));
    }
  }
}
