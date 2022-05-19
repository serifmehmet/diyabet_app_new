import 'package:diyabet_app/data/datasources/local/food_cache/food_cache_local_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/food_cache/food_cache_remote_datasource.dart';
import 'package:diyabet_app/domain/entities/food_cache.dart';

abstract class FoodCacheRepository {
  Future<void> getAllFoodsForCache();
}

class FoodCacheRepositoryImpl extends FoodCacheRepository {
  final FoodCacheRemoteDataSource foodCacheRemoteDataSource;
  final FoodCacheLocalDataSource foodCacheLocalDataSource;

  FoodCacheRepositoryImpl({required this.foodCacheRemoteDataSource, required this.foodCacheLocalDataSource});

  @override
  Future<void> getAllFoodsForCache() async {
    final foodCacheModel = await foodCacheRemoteDataSource.getAllFoodsForCache();

    final foodCacheHiveModels = foodCacheModel!.toHiveModel();
    await foodCacheLocalDataSource.saveLocalFood(foodCacheHiveModels);
  }
}
