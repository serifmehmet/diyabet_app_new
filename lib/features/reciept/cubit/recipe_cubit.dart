import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/domain/entities/recipe_food.dart';
import 'package:diyabet_app/domain/usecases/recipe/remote/params/save_remote_recipe_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/base/error/error_object.dart';
import '../../../domain/entities/local_food.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/usecases/recipe/remote/save_remote_recipe_usecase.dart';

part 'recipe_cubit.freezed.dart';
part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit({
    required SaveRemoteRecipeUseCase saveRemoteRecipeUseCase,
  })  : _saveRemoteRecipeUseCase = saveRemoteRecipeUseCase,
        super(const RecipeState.initial());

  final SaveRemoteRecipeUseCase _saveRemoteRecipeUseCase;
  late final List<LocalFood> _foodsAddedToRecipe = [];
  double totalCarb = 0;

  ///Add Food Object to List of Foods
  void saveLocalFoodToRecipe(LocalFood foodToAdd) {
    _foodsAddedToRecipe.add(foodToAdd);
    totalCarb += foodToAdd.CarbTotal!;
    emit(_FoodAddedSuccess(foodsAddedToRecipe: _foodsAddedToRecipe, carbValue: totalCarb));
  }

  ///Deletes a single Food object from the list.
  void deleteSingleFood(int foodIndex) {
    double carbValue = 0;
    _foodsAddedToRecipe.removeWhere((food) => food.Index == foodIndex);

    if (_foodsAddedToRecipe.isEmpty) {
      emit(const _Initial());
    } else {
      for (var foodItem in _foodsAddedToRecipe) {
        carbValue += foodItem.CarbTotal!;
      }

      emit(_FoodDeleteSuccess(foodsAddedToRecipe: _foodsAddedToRecipe, carbValue: carbValue));
    }
  }

  /// Saves the Recipe to the Remote Database using the API
  Future<void> saveRemoteRecipe({required String recipeName, required int portionQuantity}) async {
    emit(const _Loading());
    List<RecipeFood> recipeFoodList = mapLocalFoodToRecipeFood();
    Recipe recipeEntity = Recipe(
      id: 0,
      isApproved: false,
      name: recipeName,
      portionQuantity: portionQuantity,
      totalCarb: totalCarb,
      userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
      recipeFoods: recipeFoodList,
    );

    final saveRecipeResponse = await _saveRemoteRecipeUseCase.call(SaveRemoteRecipeParams(recipeEntity: recipeEntity));

    saveRecipeResponse.fold((failure) {
      emit(_Failure(
        errorObject: ErrorObject.mapFailureToErrorObject(failure: failure),
      ));
    }, (success) {
      emit(const _RecipeSaveSuccess(successMessage: "Tarifiniz başarıyla kaydedildi"));
    });
  }

  List<RecipeFood> mapLocalFoodToRecipeFood() {
    List<RecipeFood> recipeFoodList = [];
    for (var localFood in _foodsAddedToRecipe) {
      RecipeFood singleRecipeFood = RecipeFood(
        foodName: localFood.FoodName,
        carbValue: localFood.CarbTotal,
        unitId: localFood.UnitId,
        foodId: localFood.Id,
        quantity: localFood.Quantity,
      );

      recipeFoodList.add(singleRecipeFood);
    }

    return recipeFoodList;
  }
}
