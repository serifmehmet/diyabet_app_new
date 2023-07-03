// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsumptionModel _$ConsumptionModelFromJson(Map<String, dynamic> json) =>
    ConsumptionModel(
      name: json['name'] as String?,
      unitName: json['unitName'] as String?,
      quantity: json['quantity'] as int?,
      totalCarb: (json['totalCarb'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ConsumptionModelToJson(ConsumptionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unitName': instance.unitName,
      'quantity': instance.quantity,
      'totalCarb': instance.totalCarb,
    };
