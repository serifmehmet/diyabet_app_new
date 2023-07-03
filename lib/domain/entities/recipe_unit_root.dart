import 'package:diyabet_app/domain/entities/recipe_unit.dart';

class RecipeUnitRoot {
  final List<RecipeUnit>? recipeUnitList;
  final String? errorCode;
  final String? errorDescription;

  RecipeUnitRoot({
    this.recipeUnitList,
    this.errorCode,
    this.errorDescription,
  });
}
