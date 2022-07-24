import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_iko_repository.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/save_user_iko_params.dart';

class SaveLocalUserIkoUseCase extends UseCase<void, SaveUserIkoParams> {
  final LocalUserIkoRepository localUserIkoRepository;

  SaveLocalUserIkoUseCase({required this.localUserIkoRepository});
  @override
  Future<void> call(SaveUserIkoParams params) async {
    await localUserIkoRepository.saveSingleUserIko(params.userIko!.toHiveModel());
  }
}
