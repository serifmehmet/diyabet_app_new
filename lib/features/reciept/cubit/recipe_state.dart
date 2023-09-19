part of 'recipe_cubit.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.initial() = _Initial;
  const factory RecipeState.loading() = _Loading;
  const factory RecipeState.loadSuccess({required RecipeRoot recipeRootEntity}) = _LoadSuccess;
  const factory RecipeState.recipeListInitial() = _RecipeListInitial;
  //Food operations for recipe
  const factory RecipeState.foodAddSuccess(
      {required List<LocalConsumptionItem> foodsAddedToRecipe, required double carbValue}) = _FoodAddedSuccess;
  const factory RecipeState.foodDeleteSuccess(
      {required List<LocalConsumptionItem> foodsAddedToRecipe, required double carbValue}) = _FoodDeleteSuccess;
  const factory RecipeState.recipeSaveSuccess({required String successMessage}) = RecipeSaveSuccess;
  const factory RecipeState.recipeDeleteSuccess({required String successMessage}) = _RecipeDeleteSuccess;

  const factory RecipeState.recipeUnitListLoaded({required List<RecipeUnit> recipeUnitList}) = _RecipeUnitListLoaded;

  const factory RecipeState.failure({required ErrorObject errorObject}) = _Failure;
  const factory RecipeState.getRecipeFailure({required ErrorObject errorObject}) = _GetRecipeError;
}
