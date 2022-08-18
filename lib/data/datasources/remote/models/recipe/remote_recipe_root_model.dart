import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'remote_recipe_root_model.g.dart';

@JsonSerializable()
class RemoteRecipeRootModel extends INetworkModel<RemoteRecipeRootModel> {
  String? errorCode;
  String? errorDescription;
  List<RemoteRecipeModel>? recipes;

  RemoteRecipeRootModel({
    this.errorCode,
    this.errorDescription,
    this.recipes,
  });

  @override
  factory RemoteRecipeRootModel.fromJson(Map<String, dynamic> json) {
    return _$RemoteRecipeRootModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RemoteRecipeRootModelToJson(this);
  }

  @override
  RemoteRecipeRootModel fromJson(Map<String, dynamic> json) {
    return RemoteRecipeRootModel.fromJson(json);
  }
}
