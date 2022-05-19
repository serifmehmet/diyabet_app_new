import 'package:diyabet_app/data/datasources/remote/food_cache/food_cache_remote_datasource.dart';
import 'package:diyabet_app/domain/entities/food_cache.dart';

abstract class FoodCacheRepository {
  Future<List<FoodCache>?> getAllFoodsForCache();
}

class FoodCacheRepositoryImpl extends FoodCacheRepository {
  final FoodCacheRemoteDataSource foodCacheRemoteDataSource;

  FoodCacheRepositoryImpl({required this.foodCacheRemoteDataSource});

  @override
  Future<List<FoodCache>?> getAllFoodsForCache() async {
    final foodCacheModel = await foodCacheRemoteDataSource.getAllFoodsForCache();

    if (foodCacheModel == null) return null;

    final foodCache = foodCacheModel.map((e) => e.toEntity()).toList();

    return foodCache;
  }
}
