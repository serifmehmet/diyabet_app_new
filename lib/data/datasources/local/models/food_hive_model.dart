import 'package:hive/hive.dart';

part 'food_hive_model.g.dart';

@HiveType(typeId: 2)
class FoodHiveModel extends HiveObject {
  static const String boxKey = "foodModel";

  @HiveField(1)
  late String foodName;

  @HiveField(2)
  late String unitType;

  @HiveField(3)
  late String quantity;

  @HiveField(4)
  late double carbTotal;
}
