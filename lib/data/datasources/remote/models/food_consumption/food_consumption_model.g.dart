// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_consumption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodConsumptionModel _$FoodConsumptionModelFromJson(
        Map<String, dynamic> json) =>
    FoodConsumptionModel(
      id: json['id'] as int?,
      foodList: (json['foodList'] as List<dynamic>?)
          ?.map((e) =>
              FoodForFoodConsumptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
    );

Map<String, dynamic> _$FoodConsumptionModelToJson(
        FoodConsumptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'foodList': instance.foodList,
      'createDate': instance.createDate?.toIso8601String(),
    };
