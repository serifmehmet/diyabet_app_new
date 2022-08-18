// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_recipe_root_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRecipeRootModel _$RemoteRecipeRootModelFromJson(
        Map<String, dynamic> json) =>
    RemoteRecipeRootModel(
      errorCode: json['errorCode'] as String?,
      errorDescription: json['errorDescription'] as String?,
      recipes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => RemoteRecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteRecipeRootModelToJson(
        RemoteRecipeRootModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorDescription': instance.errorDescription,
      'recipes': instance.recipes,
    };
