import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_for_food_consumption_model.dart';

class FoodForFoodConsumption {
  final int? Id;
  final int? FoodId;
  final int? UnitTypeId;
  final int? Quantity;
  final int? UserId;

  FoodForFoodConsumption({
    this.Id,
    this.FoodId,
    this.UnitTypeId,
    this.Quantity,
    this.UserId,
  });

  FoodForFoodConsumptionModel toModel() => FoodForFoodConsumptionModel(
        id: Id,
        foodId: FoodId,
        quantity: Quantity,
        unitId: UnitTypeId,
        userId: UserId,
      );
}
