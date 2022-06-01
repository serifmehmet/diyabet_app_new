import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_food_repository.dart';
import 'package:diyabet_app/domain/usecases/food/params/update_local_food_usecase.dart';

class UpdateLocalFoodUseCase extends UseCase<void, UpdateLocalFoodParam> {
  final LocalFoodRepository localFoodRepository;

  UpdateLocalFoodUseCase({required this.localFoodRepository});

  @override
  Future<void> call(UpdateLocalFoodParam params) async {
    await localFoodRepository.updateSingleFood(params.foodToUpdateEntity!.toHiveModel());
  }
}
