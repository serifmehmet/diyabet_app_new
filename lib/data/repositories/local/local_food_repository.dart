import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/cache_food_list_item.dart';
import '../../datasources/local/cache_food/cache_food_local_datasource.dart';
import '../../datasources/local/models/food_cache_hive_model.dart';

abstract class LocalFoodRepository {
  Future<FoodCacheHiveModel?> getFoodCache();
  Future<List<CacheFoodListItem?>> getFoodByName(String name);
}

class LocalFoodRepositoryImpl extends LocalFoodRepository {
  final CacheFoodLocalDataSource cacheFoodLocalDataSource;

  LocalFoodRepositoryImpl({required this.cacheFoodLocalDataSource});

  @override
  Future<FoodCacheHiveModel?> getFoodCache() async {
    final foodCacheBox = Hive.box<FoodCacheHiveModel>(FoodCacheHiveModel.boxKey);

    return foodCacheBox.get("foodCache");
  }

  @override
  Future<List<CacheFoodListItem?>> getFoodByName(String name) async {
    final foodsFromCache = await cacheFoodLocalDataSource.searchFoodByName(name);

    final cacheFoodItems = foodsFromCache.map((e) => e!.toEntity()).toList();

    return cacheFoodItems;
  }
}
