// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_iko_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIkoModel _$UserIkoModelFromJson(Map<String, dynamic> json) => UserIkoModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      ikoValue: (json['ikoValue'] as num?)?.toDouble(),
      hour:
          json['hour'] == null ? null : DateTime.parse(json['hour'] as String),
    );

Map<String, dynamic> _$UserIkoModelToJson(UserIkoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'ikoValue': instance.ikoValue,
      'hour': instance.hour?.toIso8601String(),
    };
