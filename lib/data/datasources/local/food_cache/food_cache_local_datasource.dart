import 'package:diyabet_app/data/datasources/local/models/food_cache_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/food_to_cache_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FoodCacheLocalDataSource {
  Future<void> saveLocalFood(FoodCacheHiveModel cacheFood) async {
    final foodCacheBox = Hive.box<FoodCacheHiveModel>(FoodCacheHiveModel.boxKey);

    await foodCacheBox.clear();
    await foodCacheBox.put("foodCache", cacheFood);
  }
}
