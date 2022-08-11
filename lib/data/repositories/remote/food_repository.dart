import 'package:diyabet_app/domain/entities/remote_food_root.dart';

import '../../datasources/remote/food/food_remote_datasouce.dart';

abstract class FoodRepository {
  // Future<Food?> getFoodByName(String foodName);
  Future<RemoteFoodRoot?> getFoodById(int foodId);
}

class FoodRepositoryImpl extends FoodRepository {
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodRepositoryImpl({required this.foodRemoteDataSource});

  // @override
  // Future<Food?> getFoodByName(String foodName) async {
  //   final foodModel = await foodRemoteDataSource.getFoodByName(foodName);

  //   if (foodModel == null) return null;

  //   final food = foodModel.toEntity();

  //   return food;
  // }

  @override
  Future<RemoteFoodRoot?> getFoodById(int foodId) async {
    final foodModel = await foodRemoteDataSource.getFoodById(foodId);

    if (foodModel == null) return null;

    final remoteFood = foodModel.toEntity();

    return remoteFood;
  }
}
