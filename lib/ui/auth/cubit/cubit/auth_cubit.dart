import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> appStarted() async {
    bool isSignIn = CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN);

    if (isSignIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

  Future<void> logIn() async {
    CacheManager.instance.setBoolValue(PreferencesKeys.IS_LOGGEDIN, true);
  }

  Future<void> logOut() async {
    CacheManager.instance.setBoolValue(PreferencesKeys.IS_LOGGEDIN, false);
  }
}
