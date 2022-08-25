import 'package:diyabet_app/domain/entities/recipe_food.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'remote_recipe_food_model.g.dart';

@JsonSerializable()
class RemoteRecipeFoodModel extends INetworkModel<RemoteRecipeFoodModel> {
  int? id;
  int? recipeId;

  String? foodName;
  String? unitName;
  int? foodId;
  int? unitId;
  int? quantity;
  double? carbValue;
  DateTime? createdAt;
  DateTime? updatedAt;

  RemoteRecipeFoodModel({
    this.id,
    this.foodName,
    this.unitName,
    this.foodId,
    this.unitId,
    this.quantity,
    this.recipeId,
    this.carbValue,
    this.createdAt,
    this.updatedAt,
  });

  @override
  factory RemoteRecipeFoodModel.fromJson(Map<String, dynamic> json) {
    return _$RemoteRecipeFoodModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RemoteRecipeFoodModelToJson(this);
  }

  @override
  RemoteRecipeFoodModel fromJson(Map<String, dynamic> json) {
    return RemoteRecipeFoodModel.fromJson(json);
  }

  RecipeFood toEntity() => RecipeFood(
        id: id,
        carbValue: carbValue,
        createdAt: createdAt,
        foodId: foodId,
        foodName: foodName,
        quantity: quantity,
        recipeId: recipeId,
        unitId: unitId,
        unitName: unitName,
        updatedAt: updatedAt,
      );
}
