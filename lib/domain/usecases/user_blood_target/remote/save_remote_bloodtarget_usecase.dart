import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/save_user_bloodtarget_params.dart';

import '../../../../data/repositories/remote/user_repository.dart';

class SaveRemoteBloodTargetUseCase extends UseCase<bool, SaveUserBloodTargetParams> {
  final UserRepository userRepository;

  SaveRemoteBloodTargetUseCase({required this.userRepository});

  @override
  Future<bool> call(SaveUserBloodTargetParams params) async {
    final response = await userRepository.addUserBloodTarget(params.userBloodTarget.toRemoteModel());

    return response;
  }
}
