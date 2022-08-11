import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_blood_target_repository.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/get_local_user_bloodtarget_params.dart';

class GetLocalUserBloodTargetUseCase extends UseCase<UserBloodTarget, GetLocalUserBloodTargetParams> {
  final LocalUserBloodTargetRepository localUserBloodTargetRepository;

  GetLocalUserBloodTargetUseCase({required this.localUserBloodTargetRepository});

  @override
  Future<UserBloodTarget> call(GetLocalUserBloodTargetParams params) async {
    final userBT = await localUserBloodTargetRepository.getSingleUserBloodTarget(params.userId);

    return userBT;
  }
}
