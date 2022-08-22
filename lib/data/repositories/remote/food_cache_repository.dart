import '../../datasources/local/cache_food/cache_food_local_datasource.dart';
import '../../datasources/remote/food_cache/food_cache_remote_datasource.dart';

abstract class FoodCacheRepository {
  Future<void> getAllFoodsForCache();
}

class FoodCacheRepositoryImpl extends FoodCacheRepository {
  final FoodCacheRemoteDataSource foodCacheRemoteDataSource;
  final CacheFoodLocalDataSource foodCacheLocalDataSource;

  FoodCacheRepositoryImpl({required this.foodCacheRemoteDataSource, required this.foodCacheLocalDataSource});

  @override
  Future<void> getAllFoodsForCache() async {
    final foodCacheModel = await foodCacheRemoteDataSource.getAllFoodsForCache();

    final foodCacheHiveModels = foodCacheModel!.toHiveModel();
    await foodCacheLocalDataSource.saveLocalFood(foodCacheHiveModels);
  }
}
