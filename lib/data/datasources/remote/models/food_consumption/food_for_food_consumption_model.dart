import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:diyabet_app/domain/entities/food_for_food_consumption.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'food_for_food_consumption_model.g.dart';

@JsonSerializable()
class FoodForFoodConsumptionModel extends INetworkModel<FoodForFoodConsumptionModel> {
  int? id;
  int? foodId;
  int? unitId;
  double? carbTotal;
  int? quantity;
  String? foodName;
  String? unitName;

  FoodForFoodConsumptionModel({
    this.id,
    this.carbTotal,
    this.foodId,
    this.quantity,
    this.unitId,
    this.foodName,
    this.unitName,
  });

  @override
  factory FoodForFoodConsumptionModel.fromJson(Map<String, dynamic> json) {
    return _$FoodForFoodConsumptionModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$FoodForFoodConsumptionModelToJson(this);
  }

  @override
  FoodForFoodConsumptionModel fromJson(Map<String, dynamic> json) {
    return FoodForFoodConsumptionModel.fromJson(json);
  }

  FoodForFoodConsumption toEntity() => FoodForFoodConsumption(Id: id, FoodId: foodId, UnitTypeId: unitId, CarbTotal: carbTotal, Quantity: quantity);
}
