// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRecipeModel _$RemoteRecipeModelFromJson(Map<String, dynamic> json) =>
    RemoteRecipeModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isApproved: json['isApproved'] as bool?,
      portionQuantity: json['portionQuantity'] as int?,
      userId: json['userId'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      recipeFoods: (json['recipeFoods'] as List<dynamic>?)
          ?.map(
              (e) => RemoteRecipeFoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteRecipeModelToJson(RemoteRecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isApproved': instance.isApproved,
      'portionQuantity': instance.portionQuantity,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'recipeFoods': instance.recipeFoods,
    };
