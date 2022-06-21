import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_iko_repository.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/save_local_use_iko_params.dart';

class SaveLocalUserIkoUseCase extends UseCase<void, SaveLocalUserIkoParams> {
  final LocalUserIkoRepository localUserIkoRepository;

  SaveLocalUserIkoUseCase({required this.localUserIkoRepository});
  @override
  Future<void> call(SaveLocalUserIkoParams params) async {
    await localUserIkoRepository.saveSingleUserIko(params.userIko!.toHiveModel());
  }
}
