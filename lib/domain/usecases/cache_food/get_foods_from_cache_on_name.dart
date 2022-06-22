import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_food_repository.dart';
import 'package:diyabet_app/domain/entities/cache_food_list_item.dart';
import 'package:diyabet_app/domain/usecases/cache_food/params/search_cache_food_params.dart';

class GetFoodsFromCacheOnName extends UseCase<List<CacheFoodListItem?>, SearchCacheFoodParams> {
  final LocalFoodRepository localFoodRepository;

  GetFoodsFromCacheOnName({required this.localFoodRepository});

  @override
  Future<List<CacheFoodListItem?>> call(SearchCacheFoodParams params) {
    return localFoodRepository.getFoodByName(params.foodName);
  }
}
