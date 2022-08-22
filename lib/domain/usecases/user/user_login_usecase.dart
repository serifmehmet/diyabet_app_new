import '../../../core/init/usecase/usecase.dart';
import '../../../data/repositories/remote/user_repository.dart';

import '../../entities/user.dart';
import 'params/user_login_param.dart';

class UserLoginUseCase extends UseCase<User?, UserLoginParam> {
  final UserRepository userRepositoryImpl;

  UserLoginUseCase({required this.userRepositoryImpl});

  @override
  Future<User?> call(UserLoginParam params) {
    return userRepositoryImpl.login(params.email, params.password);
  }
}
