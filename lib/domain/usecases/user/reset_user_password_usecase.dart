import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/entities/generic_response.dart';
import 'package:diyabet_app/domain/usecases/user/params/reset_user_password_params.dart';

class ResetUserPasswordUseCase extends UseCase<GenericResponse, ResetUserPasswordParams> {
  final UserRepository userRepository;

  ResetUserPasswordUseCase({required this.userRepository});

  @override
  Future<GenericResponse> call(ResetUserPasswordParams params) async {
    return userRepository.resetPassword(params.email, params.password);
  }
}
