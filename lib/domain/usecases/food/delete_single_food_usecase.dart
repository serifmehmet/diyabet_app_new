import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_food_repository.dart';
import 'package:diyabet_app/domain/usecases/food/params/delete_food_param.dart';

class DeleteSingleFoodUseCase extends UseCase<void, DeleteFoodParam> {
  final LocalFoodRepository localFoodRepository;

  DeleteSingleFoodUseCase({required this.localFoodRepository});

  @override
  Future<void> call(DeleteFoodParam params) async {
    await localFoodRepository.deleteSingleFood(params.foodId);
  }
}
