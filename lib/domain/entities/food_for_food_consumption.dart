import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_for_food_consumption_model.dart';

class FoodForFoodConsumption {
  final int? Id;
  final int? FoodId;
  final int? UnitTypeId;
  final String? FoodName;
  final String? UnitName;
  final double? CarbTotal;
  final int? Quantity;

  FoodForFoodConsumption({
    this.Id,
    this.FoodId,
    this.UnitTypeId,
    this.FoodName,
    this.UnitName,
    this.CarbTotal,
    this.Quantity,
  });

  FoodForFoodConsumptionModel toModel() => FoodForFoodConsumptionModel(
        id: Id,
        foodId: FoodId,
        quantity: Quantity,
        carbTotal: CarbTotal,
        foodName: FoodName,
        unitName: UnitName,
      );
}
