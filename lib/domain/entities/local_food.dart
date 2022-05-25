import 'package:diyabet_app/data/datasources/local/models/food_hive_model.dart';

class LocalFood {
  final int? Id;
  final String? FoodName;
  final String? UnitType;
  final int? Quantity;
  final double? CarbTotal;
  final int? Index;

  LocalFood({
    this.Id,
    this.FoodName,
    this.UnitType,
    this.Quantity,
    this.CarbTotal,
    this.Index,
  });

  FoodHiveModel toHiveModel() => FoodHiveModel()
    ..id = Id!
    ..foodName = FoodName!
    ..carbTotal = CarbTotal!
    ..quantity = Quantity!
    ..unitType = UnitType!
    ..index = Index!;
}
