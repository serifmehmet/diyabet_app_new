// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_cache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCacheModel _$FoodCacheModelFromJson(Map<String, dynamic> json) =>
    FoodCacheModel(
      FoodOnCache: (json['foodList'] as List<dynamic>?)
          ?.map((e) => FoodOnCacheModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ErrorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$FoodCacheModelToJson(FoodCacheModel instance) =>
    <String, dynamic>{
      'foodList': instance.FoodOnCache,
      'errorCode': instance.ErrorCode,
    };
