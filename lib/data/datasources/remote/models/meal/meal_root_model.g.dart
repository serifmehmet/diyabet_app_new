// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_root_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealRootModel _$MealRootModelFromJson(Map<String, dynamic> json) =>
    MealRootModel(
      errorCode: json['errorCode'] as String?,
      errorDescription: json['errorDescription'] as String?,
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => MealModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealRootModelToJson(MealRootModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorDescription': instance.errorDescription,
      'meals': instance.meals,
    };
