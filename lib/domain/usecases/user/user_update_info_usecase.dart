import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/usecases/user/params/update_user_info_params.dart';

import '../../../core/init/usecase/usecase.dart';

class UserUpdateInfoUseCase extends UseCase<GenericResponseModel, UpdateUserInfoParams> {
  final UserRepository userRepository;

  UserUpdateInfoUseCase({required this.userRepository});

  @override
  Future<GenericResponseModel> call(UpdateUserInfoParams params) {
    return userRepository.updateUserInfo(
      params.userId,
      params.name,
      params.surName,
      params.password,
    );
  }
}
