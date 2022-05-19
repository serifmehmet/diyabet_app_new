import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/food_cache_repository.dart';
import 'package:diyabet_app/domain/entities/food_cache.dart';

class GetAllFoodsForCache extends UseCase<List<FoodCache>?, NoParams> {
  final FoodCacheRepository foodCacheRepository;

  GetAllFoodsForCache({required this.foodCacheRepository});

  @override
  Future<List<FoodCache>?> call(NoParams params) {
    return foodCacheRepository.getAllFoodsForCache();
  }
}
