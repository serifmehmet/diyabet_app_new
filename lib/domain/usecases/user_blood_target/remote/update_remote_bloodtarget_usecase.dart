import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/usecases/user_blood_target/params/update_blood_target_params.dart';

import '../../../../core/base/error/failure.dart';
import '../../../entities/generic_response.dart';

class UpdateRemoteBloodTargetUseCase extends UseCase<Either<Failure, GenericResponse>, UpdateBloodTargetParams> {
  final UserRepository userRepository;

  UpdateRemoteBloodTargetUseCase({required this.userRepository});

  @override
  Future<Either<Failure, GenericResponse>> call(UpdateBloodTargetParams params) async {
    final response = userRepository.updateUserBloodTarget(params.userBloodTarget.toRemoteModel());

    return response;
  }
}
