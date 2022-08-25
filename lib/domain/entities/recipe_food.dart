import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_food_model.dart';

class RecipeFood {
  final int? id;
  final String? foodName;
  final String? unitName;
  final int? recipeId;
  final int? foodId;
  final int? unitId;
  final int? quantity;
  final double? carbValue;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  RecipeFood({
    this.id,
    this.foodName,
    this.unitName,
    this.recipeId,
    this.foodId,
    this.unitId,
    this.carbValue,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  RemoteRecipeFoodModel toModel() => RemoteRecipeFoodModel(
        carbValue: carbValue,
        createdAt: createdAt,
        foodId: foodId,
        foodName: foodName,
        id: id,
        quantity: quantity,
        recipeId: recipeId,
        unitId: unitId,
        unitName: unitName,
        updatedAt: updatedAt,
      );
}
