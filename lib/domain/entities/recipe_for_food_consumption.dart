import 'package:diyabet_app/data/datasources/remote/models/food_consumption/recipe_for_food_consumption_model.dart';

class RecipeForFoodConsumption {
  final int? recipeId;
  final int? quantity;

  RecipeForFoodConsumption({
    this.recipeId,
    this.quantity,
  });

  RecipeForFoodConsumptionModel toModel() => RecipeForFoodConsumptionModel(
        recipeId: recipeId,
        quantity: quantity,
      );
}
