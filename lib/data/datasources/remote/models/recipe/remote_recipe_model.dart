import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_food_model.dart';
import 'package:diyabet_app/domain/entities/recipe.dart';
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
  double? totalCarb;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<RemoteRecipeFoodModel>? recipeFoods;

  RemoteRecipeModel({
    this.id,
    this.name,
    this.isApproved,
    this.portionQuantity,
    this.userId,
    this.totalCarb,
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

  Recipe toEntity() => Recipe(
        id: id,
        createdDate: createdAt,
        isApproved: isApproved,
        name: name,
        portionQuantity: portionQuantity,
        recipeFoods: recipeFoods!.map((e) => e.toEntity()).toList(),
        totalCarb: totalCarb,
        updatedDate: updatedAt,
        userId: userId,
      );
}
