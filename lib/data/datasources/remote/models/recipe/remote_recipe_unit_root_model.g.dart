// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_recipe_unit_root_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRecipeUnitRootModel _$RemoteRecipeUnitRootModelFromJson(
        Map<String, dynamic> json) =>
    RemoteRecipeUnitRootModel(
      recipeUnitList: (json['recipeUnitList'] as List<dynamic>?)
          ?.map(
              (e) => RemoteRecipeUnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorCode: json['errorCode'] as String?,
      errorDescription: json['errorDescription'] as String?,
    );

Map<String, dynamic> _$RemoteRecipeUnitRootModelToJson(
        RemoteRecipeUnitRootModel instance) =>
    <String, dynamic>{
      'recipeUnitList': instance.recipeUnitList,
      'errorCode': instance.errorCode,
      'errorDescription': instance.errorDescription,
    };
