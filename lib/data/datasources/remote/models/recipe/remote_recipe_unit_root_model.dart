import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_unit_model.dart';
import 'package:diyabet_app/domain/entities/recipe_unit_root.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vexana/vexana.dart';

part 'remote_recipe_unit_root_model.g.dart';

@JsonSerializable()
class RemoteRecipeUnitRootModel extends INetworkModel<RemoteRecipeUnitRootModel> {
  List<RemoteRecipeUnitModel>? recipeUnitList;
  String? errorCode;
  String? errorDescription;

  RemoteRecipeUnitRootModel({
    this.recipeUnitList,
    this.errorCode,
    this.errorDescription,
  });

  @override
  factory RemoteRecipeUnitRootModel.fromJson(Map<String, dynamic> json) {
    return _$RemoteRecipeUnitRootModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RemoteRecipeUnitRootModelToJson(this);
  }

  @override
  RemoteRecipeUnitRootModel fromJson(Map<String, dynamic> json) {
    return RemoteRecipeUnitRootModel.fromJson(json);
  }

  RecipeUnitRoot toEntity() => RecipeUnitRoot(
        recipeUnitList: recipeUnitList!.map((e) => e.toEntity()).toList(),
        errorCode: errorCode,
        errorDescription: errorDescription,
      );
}
