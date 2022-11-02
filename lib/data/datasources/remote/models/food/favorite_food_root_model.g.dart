// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_food_root_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteFoodRootModel _$FavoriteFoodRootModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteFoodRootModel(
      favoriteFoods: (json['favoriteFoods'] as List<dynamic>?)
              ?.map(
                  (e) => FavoriteFoodModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      errorCode: json['errorCode'] as String?,
      errorDescription: json['errorDescription'] as String?,
    );

Map<String, dynamic> _$FavoriteFoodRootModelToJson(
        FavoriteFoodRootModel instance) =>
    <String, dynamic>{
      'favoriteFoods': instance.favoriteFoods,
      'errorCode': instance.errorCode,
      'errorDescription': instance.errorDescription,
    };
