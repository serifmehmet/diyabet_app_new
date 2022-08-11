import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:hive/hive.dart';

part 'food_hive_model.g.dart';

@HiveType(typeId: 2)
class FoodHiveModel extends HiveObject {
  static const String boxKey = "foodModel";

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String foodName;

  @HiveField(2)
  late String unitType;

  @HiveField(3)
  late int quantity;

  @HiveField(4)
  late double carbTotal;

  @HiveField(5)
  late int index;

  @HiveField(7)
  late int unitId;

  LocalFood toEntity() => LocalFood(
        Id: id,
        FoodName: foodName,
        UnitType: unitType,
        Quantity: quantity,
        CarbTotal: carbTotal,
        Index: index,
        UnitId: unitId,
      );
}
