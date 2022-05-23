import '../../../core/init/usecase/usecase.dart';
import '../../../data/repositories/remote/food_repository.dart';
import '../../entities/food.dart';
import 'params/get_food_param.dart';

class GetFoodOnNameUseCase extends UseCase<Food?, GetFoodParam> {
  final FoodRepository foodRepositoryImpl;

  const GetFoodOnNameUseCase({required this.foodRepositoryImpl});

  @override
  Future<Food?> call(GetFoodParam params) {
    return foodRepositoryImpl.getFoodByName(params.foodName!);
  }
}
