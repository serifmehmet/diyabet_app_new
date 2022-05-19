import 'package:diyabet_app/domain/entities/food_on_cache.dart';

class FoodCache {
  final List<FoodOnCache>? FoodList;
  final String? ErrorCode;

  FoodCache({
    this.FoodList,
    this.ErrorCode,
  });
}
