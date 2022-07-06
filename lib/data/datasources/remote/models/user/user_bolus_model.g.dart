// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bolus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBolusModel _$UserBolusModelFromJson(Map<String, dynamic> json) =>
    UserBolusModel(
      Id: (json['Id'] as num?)?.toDouble(),
      IdfValue: (json['IdfValue'] as num?)?.toDouble(),
      IkoValue: (json['IkoValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserBolusModelToJson(UserBolusModel instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'IdfValue': instance.IdfValue,
      'IkoValue': instance.IkoValue,
    };
