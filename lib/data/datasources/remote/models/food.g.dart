// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => FoodModel(
      sugarG: (json['sugarG'] as num?)?.toDouble(),
      fiberG: (json['fiberG'] as num?)?.toDouble(),
      servingSizeG: json['servingSizeG'] as int?,
      sodiumMg: json['sodiumMg'] as int?,
      name: json['name'] as String?,
      potassiumMg: json['potassiumMg'] as int?,
      fatSaturatedG: json['fatSaturatedG'] as int?,
      fatTotalG: (json['fatTotalG'] as num?)?.toDouble(),
      calories: json['calories'] as int?,
      cholesterolMg: json['cholesterolMg'] as int?,
      proteinG: (json['proteinG'] as num?)?.toDouble(),
      carbohydratesTotalG: (json['carbohydratesTotalG'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'sugarG': instance.sugarG,
      'fiberG': instance.fiberG,
      'servingSizeG': instance.servingSizeG,
      'sodiumMg': instance.sodiumMg,
      'name': instance.name,
      'potassiumMg': instance.potassiumMg,
      'fatSaturatedG': instance.fatSaturatedG,
      'fatTotalG': instance.fatTotalG,
      'calories': instance.calories,
      'cholesterolMg': instance.cholesterolMg,
      'proteinG': instance.proteinG,
      'carbohydratesTotalG': instance.carbohydratesTotalG,
    };
