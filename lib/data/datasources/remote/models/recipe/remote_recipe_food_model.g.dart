// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_recipe_food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRecipeFoodModel _$RemoteRecipeFoodModelFromJson(
        Map<String, dynamic> json) =>
    RemoteRecipeFoodModel(
      id: json['id'] as int?,
      foodName: json['foodName'] as String?,
      unitName: json['unitName'] as String?,
      foodId: json['foodId'] as int?,
      unitId: json['unitId'] as int?,
      quantity: json['quantity'] as int?,
      recipeId: json['recipeId'] as int?,
      carbValue: (json['carbValue'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$RemoteRecipeFoodModelToJson(
        RemoteRecipeFoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeId': instance.recipeId,
      'foodName': instance.foodName,
      'unitName': instance.unitName,
      'foodId': instance.foodId,
      'unitId': instance.unitId,
      'quantity': instance.quantity,
      'carbValue': instance.carbValue,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
