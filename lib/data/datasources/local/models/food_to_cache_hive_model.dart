import 'package:hive_flutter/hive_flutter.dart';

import '../../../../domain/entities/cache_food_list_item.dart';

part 'food_to_cache_hive_model.g.dart';

@HiveType(typeId: 6)
class FoodToCacheHiveModel extends HiveObject {
  static const String boxKey = "foodToCacheModel";

  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2, defaultValue: false)
  late bool isRecipe;

  CacheFoodListItem toEntity() => CacheFoodListItem(Id: id, Name: name, isRecipe: isRecipe);
}
