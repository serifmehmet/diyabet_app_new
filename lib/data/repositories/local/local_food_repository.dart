import 'package:diyabet_app/data/datasources/local/food/food_local_datasource.dart';
import 'package:diyabet_app/data/datasources/local/models/food_hive_model.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/cache_food_list_item.dart';
import '../../datasources/local/cache_food/cache_food_local_datasource.dart';
import '../../datasources/local/models/food_cache_hive_model.dart';

abstract class LocalFoodRepository {
  Future<FoodCacheHiveModel?> getFoodCache();
  Future<List<CacheFoodListItem>?> getFoodByName(String name);

  Future<void> saveSelectedFood(FoodHiveModel foodToSave);
  Future<List<LocalFood?>> getSavedFoodsFromLocal();
  Future<void> deleteAllFoods();
  Future<void> deleteSingleFood(int foodId);
  Future<LocalFood?> getSingleFood(int foodIndex);
  Future<void> updateSingleFood(FoodHiveModel foodToUpdate);
}

class LocalFoodRepositoryImpl extends LocalFoodRepository {
  final CacheFoodLocalDataSource cacheFoodLocalDataSource;
  final FoodLocalDataSource foodLocalDataSource;

  LocalFoodRepositoryImpl({
    required this.cacheFoodLocalDataSource,
    required this.foodLocalDataSource,
  });

  @override
  Future<FoodCacheHiveModel?> getFoodCache() async {
    final foodCacheBox = Hive.box<FoodCacheHiveModel>(FoodCacheHiveModel.boxKey);

    return foodCacheBox.get("foodCache");
  }

  @override
  Future<List<CacheFoodListItem>?> getFoodByName(String name) async {
    final foodsFromCache = await cacheFoodLocalDataSource.searchFoodByName(name);

    final cacheFoodItems = foodsFromCache.map((e) => e!.toEntity()).toList();

    return cacheFoodItems;
  }

  @override
  Future<void> saveSelectedFood(FoodHiveModel foodToSave) async {
    await foodLocalDataSource.saveSelectedFood(foodToSave);
  }

  @override
  Future<List<LocalFood?>> getSavedFoodsFromLocal() async {
    final localSavedFoods = await foodLocalDataSource.getFoods();

    return localSavedFoods.map((e) => e!.toEntity()).toList();
  }

  @override
  Future<void> deleteAllFoods() async {
    await foodLocalDataSource.deleteAllFoods();
  }

  @override
  Future<void> deleteSingleFood(int foodId) async {
    await foodLocalDataSource.deleteSingleFood(foodId);
  }

  @override
  Future<LocalFood?> getSingleFood(int foodIndex) async {
    final localFood = await foodLocalDataSource.getSingleFood(foodIndex);

    final foodEntity = localFood!.toEntity();

    return foodEntity;
  }

  @override
  Future<void> updateSingleFood(FoodHiveModel foodToUpdate) async {
    await foodLocalDataSource.updateSingleFood(foodToUpdate);
  }
}
