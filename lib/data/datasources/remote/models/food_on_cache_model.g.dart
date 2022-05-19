// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_on_cache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodOnCacheModel _$FoodOnCacheModelFromJson(Map<String, dynamic> json) =>
    FoodOnCacheModel(
      Id: (json['id'] as num?)?.toDouble(),
      Name: json['name'] as String?,
    );

Map<String, dynamic> _$FoodOnCacheModelToJson(FoodOnCacheModel instance) =>
    <String, dynamic>{
      'id': instance.Id,
      'name': instance.Name,
    };
