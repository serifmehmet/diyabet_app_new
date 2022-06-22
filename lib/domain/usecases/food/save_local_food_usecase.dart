import '../../../core/init/usecase/usecase.dart';
import '../../../data/repositories/local/local_food_repository.dart';
import 'params/save_local_food_param.dart';

class SaveLocalFoodUseCase extends UseCase<void, SaveLocalFoodParam> {
  final LocalFoodRepository localFoodRepository;

  SaveLocalFoodUseCase({required this.localFoodRepository});

  @override
  Future<void> call(SaveLocalFoodParam params) async {
    await localFoodRepository.saveSelectedFood(params.localFoodEntity!.toHiveModel());
  }
}
