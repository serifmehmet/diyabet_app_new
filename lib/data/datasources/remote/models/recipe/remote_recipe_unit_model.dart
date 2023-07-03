import 'package:diyabet_app/domain/entities/recipe_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vexana/vexana.dart';

part 'remote_recipe_unit_model.g.dart';

@JsonSerializable()
class RemoteRecipeUnitModel extends INetworkModel<RemoteRecipeUnitModel> {
  int? id;
  String? description;

  RemoteRecipeUnitModel({this.id, this.description});

  @override
  factory RemoteRecipeUnitModel.fromJson(Map<String, dynamic> json) {
    return _$RemoteRecipeUnitModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RemoteRecipeUnitModelToJson(this);
  }

  @override
  RemoteRecipeUnitModel fromJson(Map<String, dynamic> json) {
    return RemoteRecipeUnitModel.fromJson(json);
  }

  RecipeUnit toEntity() => RecipeUnit(
        id: id,
        description: description,
      );
}
