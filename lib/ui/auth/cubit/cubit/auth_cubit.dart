import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/domain/entities/food_cache.dart';
import 'package:diyabet_app/domain/entities/user.dart';
import 'package:diyabet_app/domain/usecases/food_cache/get_all_foods_for_cache.dart';
import 'package:diyabet_app/domain/usecases/user/params/user_login_param.dart';
import 'package:diyabet_app/domain/usecases/user/user_login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserLoginUseCase? userLoginUseCase;
  final GetAllFoodsForCache? getAllFoodsForCache;
  AuthCubit({
    this.userLoginUseCase,
    this.getAllFoodsForCache,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    final foodsForCache = await getAllFoodsForCache?.call(const NoParams());
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
        CacheManager.instance.setStringValue(PreferencesKeys.USERID, _user.Email!);
        CacheManager.instance.setStringValue(PreferencesKeys.USER_NAME, _user.FullName!);

        NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
      }
    } else {
      emit(const LoginFailure("Login olamadık"));
    }
  }

  Future<void> logOut() async {
    emit(UnAuthenticated());
    CacheManager.instance.setBoolValue(PreferencesKeys.IS_LOGGEDIN, false);
  }
}
