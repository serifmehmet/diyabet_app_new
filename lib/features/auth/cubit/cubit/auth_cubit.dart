import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/enums/preferences_keys.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../core/init/usecase/usecase.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/usecases/cache_food/get_all_foods_for_cache.dart';
import '../../../../domain/usecases/user/params/user_login_param.dart';
import '../../../../domain/usecases/user/user_login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserLoginUseCase? userLoginUseCase;
  final GetAllFoodsForCache? getAllFoodsForCache;
  AuthCubit({
    this.userLoginUseCase,
    this.getAllFoodsForCache,
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
        emit(LoginCompleted(_user));
        emit(Authenticated());

        CacheManager.instance.setBoolValue(PreferencesKeys.IS_LOGGEDIN, true);
        CacheManager.instance.setIntValue(PreferencesKeys.USERID, _user.UserId!);
        CacheManager.instance.setStringValue(PreferencesKeys.USER_NAME, _user.FullName!);

        NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
      } else {
        emit(LoginFailure("Login olamadık"));
      }
    } else {
      emit(const LoginFailure("Login olamadık"));
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
}
