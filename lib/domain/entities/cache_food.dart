import 'package:diyabet_app/domain/entities/cache_food_list_item.dart';

class CacheFood {
  final List<CacheFoodListItem>? FoodList;
  final String? ErrorCode;

  CacheFood({
    this.FoodList,
    this.ErrorCode,
  });
}
