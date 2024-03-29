import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/entities/generic_response.dart';
import 'package:diyabet_app/domain/usecases/user/params/user_register_param.dart';

class UserRegisterUseCase extends UseCase<GenericResponse, UserRegisterParam> {
  final UserRepository userRepository;

  UserRegisterUseCase({required this.userRepository});

  @override
  Future<GenericResponse> call(UserRegisterParam params) async {
    return await userRepository.register(params.user!.toModel());
  }
}
