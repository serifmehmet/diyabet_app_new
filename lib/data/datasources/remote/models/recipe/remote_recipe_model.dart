import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_food_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'remote_recipe_model.g.dart';

@JsonSerializable()
class RemoteRecipeModel extends INetworkModel<RemoteRecipeModel> {
  int? id;
  String? name;
  bool? isApproved;
  int? portionQuantity;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<RemoteRecipeFoodModel>? recipeFoods;

  RemoteRecipeModel({
    this.id,
    this.name,
    this.isApproved,
    this.portionQuantity,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.recipeFoods,
  });

  @override
  factory RemoteRecipeModel.fromJson(Map<String, dynamic> json) {
    return _$RemoteRecipeModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RemoteRecipeModelToJson(this);
  }

  @override
  RemoteRecipeModel fromJson(Map<String, dynamic> json) {
    return RemoteRecipeModel.fromJson(json);
  }
}
