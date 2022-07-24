import 'package:diyabet_app/core/base/model/generic_response_model.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/user_repository.dart';
import 'package:diyabet_app/domain/usecases/user_bolus/params/save_calculated_userbolus_params.dart';

class SaveCalculatedUserBolusUsecase extends UseCase<GenericResponseModel, SaveCalculatedUserBolusParams> {
  final UserRepository userRepository;

  SaveCalculatedUserBolusUsecase({required this.userRepository});

  @override
  Future<GenericResponseModel> call(SaveCalculatedUserBolusParams params) async {
    final response = await userRepository.saveCalculatedUserBolus(params.mealId!, params.userBolus!.toRemoteModel());

    return response;
  }
}
