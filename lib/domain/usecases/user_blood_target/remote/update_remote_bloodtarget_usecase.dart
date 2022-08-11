import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/update_blood_target_params.dart';

class UpdateRemoteBloodTargetUseCase extends UseCase<bool, UpdateBloodTargetParams> {
  final UserRepository userRepository;

  UpdateRemoteBloodTargetUseCase({required this.userRepository});

  @override
  Future<bool> call(UpdateBloodTargetParams params) async {
    final response = userRepository.updateUserBloodTarget(params.userBloodTarget.toRemoteModel());

    return response;
  }
}
