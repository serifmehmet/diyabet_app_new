import '../../../domain/entities/food.dart';
import '../../datasources/remote/food/food_remote_datasouce.dart';

abstract class FoodRepository {
  Future<Food?> getFoodByName(String foodName);
}

class FoodRepositoryImpl extends FoodRepository {
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodRepositoryImpl({required this.foodRemoteDataSource});

  @override
  Future<Food?> getFoodByName(String foodName) async {
    final foodModel = await foodRemoteDataSource.getFoodByName(foodName);

    if (foodModel == null) return null;

    final food = foodModel.toEntity();

    return food;
  }
}
