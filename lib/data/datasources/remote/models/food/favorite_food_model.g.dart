// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteFoodModel _$FavoriteFoodModelFromJson(Map<String, dynamic> json) =>
    FavoriteFoodModel(
      id: json['id'] as int?,
      foodId: json['foodId'] as int?,
      foodName: json['foodName'] as String?,
    );

Map<String, dynamic> _$FavoriteFoodModelToJson(FavoriteFoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'foodId': instance.foodId,
      'foodName': instance.foodName,
    };
