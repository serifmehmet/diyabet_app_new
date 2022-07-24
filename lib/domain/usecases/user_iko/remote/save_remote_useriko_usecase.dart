import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/save_user_iko_params.dart';

class SaveRemoteUserIkoUseCase extends UseCase<bool, SaveUserIkoParams> {
  final UserRepository userRepository;

  SaveRemoteUserIkoUseCase({required this.userRepository});

  @override
  Future<bool> call(SaveUserIkoParams params) async {
    final response = await userRepository.addUserIko(params.userIko!.toRemoteModel());

    return response;
  }
}
