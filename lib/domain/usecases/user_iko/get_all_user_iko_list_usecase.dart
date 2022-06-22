import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_user_iko_repository.dart';
import 'package:diyabet_app/domain/entities/user_iko.dart';
import 'package:diyabet_app/domain/usecases/user_iko/params/get_all_user_iko_params.dart';

class GetAllUserIkoListUseCase extends UseCase<List<UserIko>, GetAllUserIkoListParams> {
  final LocalUserIkoRepository localUserIkoRepository;

  GetAllUserIkoListUseCase({required this.localUserIkoRepository});
  @override
  Future<List<UserIko>> call(GetAllUserIkoListParams params) async {
    return await localUserIkoRepository.getUserIkoList(params.userId);
  }
}
