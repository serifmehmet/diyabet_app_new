import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_idf_repository.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/save_user_idf_params.dart';

class SaveLocalUserIdfUseCase extends UseCase<void, SaveUserIdfParams> {
  final LocalUserIdfRepository localUserIdfRepository;

  SaveLocalUserIdfUseCase({required this.localUserIdfRepository});

  @override
  Future<void> call(SaveUserIdfParams params) async {
    await localUserIdfRepository.saveSingleUserIdf(params.userIdf!.toHiveModel());
  }
}
