import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/food_repository.dart';
import 'package:diyabet_app/domain/entities/food.dart';
import 'package:diyabet_app/domain/usecases/food/params/get_food_param.dart';

class GetFoodOnNameUseCase extends UseCase<Food?, GetFoodParam> {
  final FoodRepository foodRepositoryImpl;

  const GetFoodOnNameUseCase(this.foodRepositoryImpl);

  @override
  Future<Food?> call(GetFoodParam params) {
    return foodRepositoryImpl.getFoodByName(params.foodName);
  }
}
