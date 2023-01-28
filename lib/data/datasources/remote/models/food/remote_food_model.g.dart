// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteFoodModel _$RemoteFoodModelFromJson(Map<String, dynamic> json) =>
    RemoteFoodModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      showInSearch: json['showInSearch'] as bool?,
      info: json['info'] as String?,
    );

Map<String, dynamic> _$RemoteFoodModelToJson(RemoteFoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInSearch': instance.showInSearch,
      'info': instance.info,
    };
