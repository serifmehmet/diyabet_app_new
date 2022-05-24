import 'package:diyabet_app/data/datasources/local/models/food_hive_model.dart';

class LocalFood {
  final int? Id;
  final String? FoodName;
  final String? UnitType;
  final int? Quantity;
  final double? CarbTotal;

  LocalFood({
    this.Id,
    this.FoodName,
    this.UnitType,
    this.Quantity,
    this.CarbTotal,
  });

  FoodHiveModel toHiveModel() => FoodHiveModel()
    ..id = Id!
    ..foodName = FoodName!
    ..carbTotal = CarbTotal!
    ..quantity = Quantity!
    ..unitType = UnitType!;
}
