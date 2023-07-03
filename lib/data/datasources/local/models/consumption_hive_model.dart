import 'package:hive/hive.dart';

import '../../../../domain/entities/local_consumption_item.dart';

part 'consumption_hive_model.g.dart';

@HiveType(typeId: 2)
class ConsumptionHiveModel extends HiveObject {
  static const String boxKey = "consumptionHiveModel";

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

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

  @HiveField(8)
  late int consumptionType;

  LocalConsumptionItem toEntity() => LocalConsumptionItem(
        Id: id,
        Name: name,
        UnitType: unitType,
        Quantity: quantity,
        CarbTotal: carbTotal,
        Index: index,
        UnitId: unitId,
        ConsumptionType: consumptionType,
      );
}
