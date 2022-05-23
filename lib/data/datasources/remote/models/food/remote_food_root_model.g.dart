// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_food_root_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteFoodRootModel _$RemoteFoodRootModelFromJson(Map<String, dynamic> json) =>
    RemoteFoodRootModel(
      food: json['food'] == null
          ? null
          : RemoteFoodModel.fromJson(json['food'] as Map<String, dynamic>),
      foodUnits: (json['foodUnits'] as List<dynamic>?)
          ?.map((e) => RemoteFoodUnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$RemoteFoodRootModelToJson(
        RemoteFoodRootModel instance) =>
    <String, dynamic>{
      'food': instance.food,
      'foodUnits': instance.foodUnits,
      'errorCode': instance.errorCode,
    };
