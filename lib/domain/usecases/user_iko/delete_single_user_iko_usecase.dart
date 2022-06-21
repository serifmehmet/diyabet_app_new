import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_iko_repository.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/delete_user_iko_params.dart';

class DeleteSingleUserIkoUseCase extends UseCase<void, DeleteUserIkoParams> {
  final LocalUserIkoRepository localUserIkoRepository;

  DeleteSingleUserIkoUseCase({required this.localUserIkoRepository});

  @override
  Future<void> call(DeleteUserIkoParams params) async {
    await localUserIkoRepository.deleteSingleUserIko(params.userIkoId);
  }
}
