// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_idf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdfModel _$UserIdfModelFromJson(Map<String, dynamic> json) => UserIdfModel(
      id: json['id'] as int?,
      hour:
          json['hour'] == null ? null : DateTime.parse(json['hour'] as String),
      userId: json['userId'] as int?,
      idfValue: (json['idfValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserIdfModelToJson(UserIdfModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hour': instance.hour?.toIso8601String(),
      'idfValue': instance.idfValue,
      'userId': instance.userId,
    };
