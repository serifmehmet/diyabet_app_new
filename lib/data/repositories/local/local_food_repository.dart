import 'package:diyabet_app/data/datasources/local/food/food_local_datasource.dart';
import 'package:diyabet_app/data/datasources/local/models/consumption_hive_model.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/cache_food_list_item.dart';
import '../../../domain/entities/local_consumption_item.dart';
import '../../datasources/local/cache_food/cache_food_local_datasource.dart';
import '../../datasources/local/models/food_cache_hive_model.dart';

abstract class LocalFoodRepository {
  Future<FoodCacheHiveModel?> getFoodCache();
  Future<List<CacheFoodListItem>?> getFoodByName(String name);

  Future<void> saveSelectedFood(ConsumptionHiveModel foodToSave);
  Future<List<LocalConsumptionItem?>> getSavedConsumptionItems();
  Future<void> deleteAllFoods();
  Future<void> deleteSingleFood(int foodId);
  Future<LocalConsumptionItem?> getSingleFood(int foodIndex);
  Future<void> updateSingleFood(ConsumptionHiveModel foodToUpdate);
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
  Future<void> saveSelectedFood(ConsumptionHiveModel foodToSave) async {
    await foodLocalDataSource.saveSelectedFood(foodToSave);
  }

  @override
  Future<List<LocalConsumptionItem?>> getSavedConsumptionItems() async {
    final localSavedFoods = await foodLocalDataSource.getItems();

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
  Future<LocalConsumptionItem?> getSingleFood(int foodIndex) async {
    final localFood = await foodLocalDataSource.getSingleFood(foodIndex);

    final foodEntity = localFood!.toEntity();

    return foodEntity;
  }

  @override
  Future<void> updateSingleFood(ConsumptionHiveModel foodToUpdate) async {
    await foodLocalDataSource.updateSingleFood(foodToUpdate);
  }
}
