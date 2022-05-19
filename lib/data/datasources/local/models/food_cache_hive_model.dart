import 'package:diyabet_app/data/datasources/local/models/food_to_cache_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'food_cache_hive_model.g.dart';

@HiveType(typeId: 5)
class FoodCacheHiveModel extends HiveObject {
  static const String boxKey = "foodCacheModel";

  @HiveField(0)
  late List<FoodToCacheHiveModel> foodList;
  @HiveField(1)
  late String errorCode;
}
