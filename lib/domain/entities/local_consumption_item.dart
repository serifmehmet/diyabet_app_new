import 'package:diyabet_app/data/datasources/local/models/consumption_hive_model.dart';

class LocalConsumptionItem {
  final int? Id;
  final String? Name;
  final String? UnitType;
  final int? Quantity;
  final double? CarbTotal;
  final int? Index;
  final int? ConsumptionType;

  final int? UnitId;

  LocalConsumptionItem({
    this.Id,
    this.Name,
    this.UnitType,
    this.Quantity,
    this.CarbTotal,
    this.Index,
    this.UnitId,
    this.ConsumptionType,
  });

  ConsumptionHiveModel toHiveModel() => ConsumptionHiveModel()
    ..id = Id!
    ..name = Name!
    ..carbTotal = CarbTotal!
    ..quantity = Quantity!
    ..unitType = UnitType!
    ..index = Index!
    ..consumptionType = ConsumptionType!
    ..unitId = UnitId!;
}
