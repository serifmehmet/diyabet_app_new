// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_for_food_consumption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodForFoodConsumptionModel _$FoodForFoodConsumptionModelFromJson(
        Map<String, dynamic> json) =>
    FoodForFoodConsumptionModel(
      id: json['id'] as int?,
      carbTotal: (json['carbTotal'] as num?)?.toDouble(),
      foodId: json['foodId'] as int?,
      quantity: json['quantity'] as int?,
      unitId: json['unitId'] as int?,
      foodName: json['foodName'] as String?,
      unitName: json['unitName'] as String?,
    );

Map<String, dynamic> _$FoodForFoodConsumptionModelToJson(
        FoodForFoodConsumptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'foodId': instance.foodId,
      'unitId': instance.unitId,
      'carbTotal': instance.carbTotal,
      'quantity': instance.quantity,
      'foodName': instance.foodName,
      'unitName': instance.unitName,
    };
