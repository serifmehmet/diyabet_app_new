// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_for_food_consumption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodForFoodConsumptionModel _$FoodForFoodConsumptionModelFromJson(
        Map<String, dynamic> json) =>
    FoodForFoodConsumptionModel(
      id: json['Id'] as int?,
      foodId: json['FoodId'] as int?,
      quantity: json['Quantity'] as int?,
      unitId: json['UnitId'] as int?,
      userId: json['UserId'] as int?,
    );

Map<String, dynamic> _$FoodForFoodConsumptionModelToJson(
    FoodForFoodConsumptionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  val['FoodId'] = instance.foodId;
  val['UnitId'] = instance.unitId;
  val['Quantity'] = instance.quantity;
  val['UserId'] = instance.userId;
  return val;
}
