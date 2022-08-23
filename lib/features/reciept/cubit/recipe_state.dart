part of 'recipe_cubit.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.initial() = _Initial;
  const factory RecipeState.loading() = _Loading;
  const factory RecipeState.loadSuccess() = _LoadSuccess;
  const factory RecipeState.foodAddSuccess({required List<LocalFood> foodsAddedToRecipe, required double carbValue}) = _FoodAddedSuccess;
  const factory RecipeState.foodDeleteSuccess({required List<LocalFood> foodsAddedToRecipe, required double carbValue}) = _FoodDeleteSuccess;
  const factory RecipeState.recipeSaveSuccess({required String successMessage}) = _RecipeSaveSuccess;
  const factory RecipeState.failure({required ErrorObject errorObject}) = _Failure;
}
