import 'package:diyabet_app/domain/entities/favorite_food_root.dart';
import 'package:diyabet_app/domain/entities/remote_food_root.dart';

import '../../../domain/entities/generic_response.dart';
import '../../datasources/remote/food/food_remote_datasouce.dart';

abstract class FoodRepository {
  // Future<Food?> getFoodByName(String foodName);
  Future<RemoteFoodRoot?> getFoodById(int foodId);
  Future<GenericResponse>? saveFavoriteFood(int foodId);
  Future<FavoriteFoodRoot> getFavoriteFoods();
}

class FoodRepositoryImpl extends FoodRepository {
  final FoodRemoteDataSource foodRemoteDataSource;

  FoodRepositoryImpl({required this.foodRemoteDataSource});

  @override
  Future<RemoteFoodRoot?> getFoodById(int foodId) async {
    final foodModel = await foodRemoteDataSource.getFoodById(foodId);

    if (foodModel == null) return null;

    final remoteFood = foodModel.toEntity();

    return remoteFood;
  }

  @override
  Future<FavoriteFoodRoot> getFavoriteFoods() async {
    final favoriteFoods = await foodRemoteDataSource.getFavoriteFoods();

    return favoriteFoods.toEntity();
  }

  @override
  Future<GenericResponse>? saveFavoriteFood(int foodId) async {
    final response = await foodRemoteDataSource.saveFavoriteFoodInfo(foodId);

    return response.toEntity();
  }
}
