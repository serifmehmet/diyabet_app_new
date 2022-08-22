// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_blood_target_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBloodTargetModel _$UserBloodTargetModelFromJson(
        Map<String, dynamic> json) =>
    UserBloodTargetModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      fbstValue: (json['fbstValue'] as num?)?.toDouble(),
      ofbgtValue: (json['ofbgtValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserBloodTargetModelToJson(
        UserBloodTargetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fbstValue': instance.fbstValue,
      'ofbgtValue': instance.ofbgtValue,
    };
