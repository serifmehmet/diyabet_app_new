// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsumptionModel _$ConsumptionModelFromJson(Map<String, dynamic> json) =>
    ConsumptionModel(
      foodId: json['foodId'] as int?,
      foodName: json['foodName'] as String?,
      unitId: json['unitId'] as int?,
      unitName: json['unitName'] as String?,
      quantity: json['quantity'] as int?,
      totalCarb: (json['totalCarb'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ConsumptionModelToJson(ConsumptionModel instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'unitId': instance.unitId,
      'unitName': instance.unitName,
      'quantity': instance.quantity,
      'totalCarb': instance.totalCarb,
    };
