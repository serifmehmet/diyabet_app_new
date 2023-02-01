import 'package:diyabet_app/data/repositories/local/local_user_blood_target_repository.dart';

import '../../../../core/init/usecase/usecase.dart';
import '../params/update_blood_target_params.dart';

class UpdateLocalBloodTargetUseCase extends UseCase<void, UpdateBloodTargetParams> {
  final LocalUserBloodTargetRepository localUserBloodTargetRepository;

  UpdateLocalBloodTargetUseCase({required this.localUserBloodTargetRepository});

  @override
  Future<void> call(UpdateBloodTargetParams params) async {
    await localUserBloodTargetRepository.updateSingleUserBloodTarget(params.userBloodTarget.toHiveModel());
  }
}
