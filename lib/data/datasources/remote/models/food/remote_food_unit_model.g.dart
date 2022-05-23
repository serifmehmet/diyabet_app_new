// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_food_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteFoodUnitModel _$RemoteFoodUnitModelFromJson(Map<String, dynamic> json) =>
    RemoteFoodUnitModel(
      id: json['id'] as int?,
      unitName: json['unitName'] as String?,
      foodId: json['foodId'] as int?,
      unitId: json['unitId'] as int?,
      carbValue: (json['carbValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RemoteFoodUnitModelToJson(
        RemoteFoodUnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitName': instance.unitName,
      'foodId': instance.foodId,
      'unitId': instance.unitId,
      'carbValue': instance.carbValue,
    };
