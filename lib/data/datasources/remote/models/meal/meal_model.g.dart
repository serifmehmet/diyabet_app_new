// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealModel _$MealModelFromJson(Map<String, dynamic> json) => MealModel(
      id: json['id'] as int?,
      mealDate: json['mealDate'] == null
          ? null
          : DateTime.parse(json['mealDate'] as String),
      bolusValue: (json['bolusValue'] as num?)?.toDouble(),
      totalCarb: (json['totalCarb'] as num?)?.toDouble(),
      consumptions: (json['consumptions'] as List<dynamic>?)
          ?.map((e) => ConsumptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
      'id': instance.id,
      'mealDate': instance.mealDate?.toIso8601String(),
      'bolusValue': instance.bolusValue,
      'totalCarb': instance.totalCarb,
      'consumptions': instance.consumptions,
    };
