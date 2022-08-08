import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:diyabet_app/domain/usecases/user/params/user_register_param.dart';
import 'package:diyabet_app/domain/usecases/user/user_register_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/save_user_bloodtarget_params.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/local/save_local_user_bloodtarget_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/local/save_user_idf_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/save_user_idf_params.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/save_user_iko_params.dart';
import 'package:diyabet_app/domain/usecases/user_iko/local/save_local_user_iko_usecase.dart';
import 'package:equatable/equatable.dart';

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
  AuthCubit({
    this.userLoginUseCase,
    this.getAllFoodsForCache,
    this.userRegisterUseCase,
    required this.saveLocalUserIdfUseCase,
    required this.saveLocalUserIkoUseCase,
    required this.saveLocalUserBloodTargetUseCase,
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
        saveRemoteBloodTargetToLocal(_user.userBloodTarget!);

        emit(LoginCompleted(_user));
        emit(Authenticated());

        CacheManager.instance.setBoolValue(PreferencesKeys.IS_LOGGEDIN, true);
        CacheManager.instance.setIntValue(PreferencesKeys.USERID, _user.UserId!);

        CacheManager.instance.setStringValue(PreferencesKeys.USER_NAME, _user.Name!);
        //CacheManager.instance.setStringValue(PreferencesKeys.USER_NAME, '${_user.Name!} ${_user.SurName!}');

        NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
      } else {
        emit(const LoginFailure("Login olamadık"));
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

  Future<void> logOut() async {
    emit(UnAuthenticated());
    CacheManager.instance.setBoolValue(PreferencesKeys.IS_LOGGEDIN, false);
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
      emit(UserRegisterSuccess());
    } else {
      emit(UserRegisterFailure(errorMessage: response.errorDescription));
    }
  }
}
