import 'package:diyabet_app/data/datasources/local/models/food_cache_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/food_to_cache_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheFoodLocalDataSource {
  Future<void> saveLocalFood(FoodCacheHiveModel cacheFood) async {
    final foodCacheBox = Hive.box<FoodCacheHiveModel>(FoodCacheHiveModel.boxKey);

    await foodCacheBox.clear();
    await foodCacheBox.put(FoodCacheHiveModel.boxKey, cacheFood);
  }

  Future<List<FoodToCacheHiveModel?>> searchFoodByName(String foodName) async {
    final foodCacheBox = Hive.box<FoodCacheHiveModel>(FoodCacheHiveModel.boxKey).values.single;

    final foods = foodCacheBox.foodList
        .where(
          (element) => element.name.toLowerCase().contains(foodName.toLowerCase()),
        )
        .toList();

    return foods;
  }
}
