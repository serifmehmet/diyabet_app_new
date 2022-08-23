import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_root_model.dart';
import 'package:diyabet_app/domain/entities/recipe.dart';

class RecipeRoot {
  final List<Recipe>? recipes;

  final String? errorCode;
  final String? errorDescription;

  RecipeRoot({
    this.recipes,
    this.errorCode,
    this.errorDescription,
  });

  RemoteRecipeRootModel toModel() => RemoteRecipeRootModel(
        errorCode: errorCode,
        errorDescription: errorDescription,
        recipes: recipes!.map((e) => e.toModel()).toList(),
      );
}
