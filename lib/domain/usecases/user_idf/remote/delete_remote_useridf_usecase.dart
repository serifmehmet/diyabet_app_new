import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/delete_user_idf_params.dart';

class DeleteRemoteUserIdfUseCase extends UseCase<bool, DeleteUserIdfParams> {
  final UserRepository userRepository;

  DeleteRemoteUserIdfUseCase({required this.userRepository});
  @override
  Future<bool> call(DeleteUserIdfParams params) async {
    final response = await userRepository.deleteUserIdf(params.userIdfToDelete!.toRemoteModel());

    return response;
  }
}
