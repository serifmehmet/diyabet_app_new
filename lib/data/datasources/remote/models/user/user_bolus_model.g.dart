// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bolus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBolusModel _$UserBolusModelFromJson(Map<String, dynamic> json) =>
    UserBolusModel(
      id: json['id'] as int? ?? 0,
      userId: json['userId'] as int?,
      calculatedBolusValue: (json['calculatedBolusValue'] as num?)?.toDouble(),
      totalCarbValue: (json['totalCarbValue'] as num?)?.toDouble(),
      calculatedTime: json['calculatedTime'] == null
          ? null
          : DateTime.parse(json['calculatedTime'] as String),
    );

Map<String, dynamic> _$UserBolusModelToJson(UserBolusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'calculatedBolusValue': instance.calculatedBolusValue,
      'totalCarbValue': instance.totalCarbValue,
      'calculatedTime': instance.calculatedTime?.toIso8601String(),
    };
