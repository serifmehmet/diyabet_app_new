import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/save_user_idf_params.dart';

class SaveRemoteUserIdf extends UseCase<bool, SaveUserIdfParams> {
  final UserRepository userRepository;

  SaveRemoteUserIdf({required this.userRepository});

  @override
  Future<bool> call(SaveUserIdfParams params) async {
    final response = await userRepository.addUserIdf(params.userIdf!.toRemoteModel());

    return response;
  }
}
