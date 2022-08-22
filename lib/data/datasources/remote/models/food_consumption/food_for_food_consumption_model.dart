import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../../../../domain/entities/food_for_food_consumption.dart';

part 'food_for_food_consumption_model.g.dart';

@JsonSerializable()
class FoodForFoodConsumptionModel extends INetworkModel<FoodForFoodConsumptionModel> {
  @JsonKey(name: "Id", includeIfNull: false)
  int? id;
  @JsonKey(name: "FoodId")
  int? foodId;
  @JsonKey(name: "UnitId")
  int? unitId;
  @JsonKey(name: "Quantity")
  int? quantity;
  @JsonKey(name: "UserId")
  int? userId;

  FoodForFoodConsumptionModel({
    this.id,
    this.foodId,
    this.quantity,
    this.unitId,
    this.userId,
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

  FoodForFoodConsumption toEntity() => FoodForFoodConsumption(Id: id, FoodId: foodId, UnitTypeId: unitId, UserId: userId, Quantity: quantity);
}
