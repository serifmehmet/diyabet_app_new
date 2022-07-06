import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_idf_repository.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/delete_user_idf_params.dart';

class DeleteSingleUserIdfUseCase extends UseCase<void, DeleteUserIdfParams> {
  final LocalUserIdfRepository localUserIdfRepository;

  DeleteSingleUserIdfUseCase({required this.localUserIdfRepository});

  @override
  Future<void> call(DeleteUserIdfParams params) async {
    await localUserIdfRepository.deleteSingleUserIdf(params.userIdfId!);
  }
}
