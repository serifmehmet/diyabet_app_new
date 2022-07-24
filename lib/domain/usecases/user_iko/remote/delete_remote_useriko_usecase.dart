import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/delete_user_iko_params.dart';

class DeleteRemoteUserIkoUseCase extends UseCase<bool, DeleteUserIkoParams> {
  final UserRepository userRepository;

  DeleteRemoteUserIkoUseCase({required this.userRepository});

  @override
  Future<bool> call(DeleteUserIkoParams params) async {
    final response = await userRepository.deleteUserIko(params.userIkoId);

    return response;
  }
}
