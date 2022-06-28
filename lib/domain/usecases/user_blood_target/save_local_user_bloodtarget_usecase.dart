import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_blood_target_repository.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/save_local_user_bloodtarget_params.dart';

class SaveLocalUserBloodTargetUseCase extends UseCase<void, SaveLocalUserBloodTargetParams> {
  final LocalUserBloodTargetRepository localUserBloodTargetRepository;

  SaveLocalUserBloodTargetUseCase({required this.localUserBloodTargetRepository});

  @override
  Future<void> call(SaveLocalUserBloodTargetParams params) async {
    await localUserBloodTargetRepository.saveUserBloodTarget(params.userBloodTarget.toHiveModel());
  }
}
