import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_consumption_model.dart';
import 'package:diyabet_app/domain/entities/food_for_food_consumption.dart';

class FoodConsumption {
  final int? Id;
  final List<FoodForFoodConsumption>? FoodList;
  final DateTime? CreateDate;
  final int? UserId;

  FoodConsumption({
    this.Id,
    this.FoodList,
    this.CreateDate,
    this.UserId,
  });

  FoodConsumptionModel toModel() => FoodConsumptionModel(
        id: Id,
        foodList: FoodList!.map((e) => e.toModel()).toList(),
        createDate: CreateDate,
        userId: UserId,
      );
}
