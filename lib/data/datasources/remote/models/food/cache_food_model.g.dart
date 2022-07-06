// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheFoodModel _$CacheFoodModelFromJson(Map<String, dynamic> json) =>
    CacheFoodModel(
      foodList: (json['foodList'] as List<dynamic>?)
          ?.map(
              (e) => CacheFoodListItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$CacheFoodModelToJson(CacheFoodModel instance) =>
    <String, dynamic>{
      'foodList': instance.foodList,
      'errorCode': instance.errorCode,
    };
