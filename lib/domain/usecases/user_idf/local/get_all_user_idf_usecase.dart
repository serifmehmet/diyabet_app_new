import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_idf_repository.dart';
import 'package:diyabet_app/domain/entities/user_idf.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/get_all_user_idf_usecase_params.dart';

class GetAllUserIdfUseCase extends UseCase<List<UserIdf>, GetAllUserIdfUseCaseParams> {
  final LocalUserIdfRepository localUserIdfRepository;

  GetAllUserIdfUseCase({required this.localUserIdfRepository});

  @override
  Future<List<UserIdf>> call(GetAllUserIdfUseCaseParams params) async {
    final userIdfList = await localUserIdfRepository.getUserIdfList(params.userId);

    return userIdfList;
  }
}
