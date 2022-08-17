import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/base/error/error_object.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  Future<void> throwUnAuthorizedError() async {
    emit(
      const UnAuthorizedUser(
        errorObject: ErrorObject(errorType: ErrorType.notLoggedIn, errorMessage: "Oturum süreniz sona erdi, giriş sayfasına yönlendiriliyorsunuz."),
      ),
    );
  }
}
