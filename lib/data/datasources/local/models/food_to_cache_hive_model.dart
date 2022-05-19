import 'package:hive_flutter/hive_flutter.dart';

part 'food_to_cache_hive_model.g.dart';

@HiveType(typeId: 4)
class FoodToCacheHiveModel extends HiveObject {
  static const String boxKey = "foodToCacheModel";

  @HiveField(0)
  late double id;
  @HiveField(1)
  late String name;
}
