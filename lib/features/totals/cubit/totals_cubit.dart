import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:diyabet_app/domain/entities/food_for_food_consumption.dart';
import 'package:diyabet_app/domain/entities/local_consumption_item.dart';
import 'package:diyabet_app/domain/entities/recipe_for_food_consumption.dart';
import 'package:diyabet_app/domain/usecases/food/delete_all_foods_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/delete_single_food_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/get_saved_local_foods_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/params/delete_food_param.dart';
import 'package:diyabet_app/domain/usecases/food/params/save_favorite_food_params.dart';
import 'package:diyabet_app/domain/usecases/food/params/save_local_food_param.dart';
import 'package:diyabet_app/domain/usecases/food/params/update_local_food_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/save_favorite_food_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/save_local_food_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/update_local_food_usecase.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/params/save_food_consumption_params.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/save_food_consumption_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'totals_state.dart';

class TotalsCubit extends Cubit<TotalsState> {
  final SaveLocalFoodUseCase saveLocalFoodUseCase;
  final SaveFavoriteFoodUsecase saveFavoriteFoodUsecase;
  final GetSavedLocalFoodsUseCase getSavedLocalFoodsUseCase;
  final DeleteAllFoodsUseCase deleteAllFoodsUseCase;
  final DeleteSingleFoodUseCase deleteSingleFoodUseCase;
  final UpdateLocalFoodUseCase updateLocalFoodUseCase;
  final SaveFoodConsumptionUseCase foodConsumptionUseCase;
  int? foodCount;
  double? carbValue;
  List<LocalConsumptionItem?>? foodsLocal;

  TotalsCubit(
    this.foodCount,
    this.carbValue, {
    this.foodsLocal,
    required this.deleteAllFoodsUseCase,
    required this.saveLocalFoodUseCase,
    required this.saveFavoriteFoodUsecase,
    required this.getSavedLocalFoodsUseCase,
    required this.deleteSingleFoodUseCase,
    required this.updateLocalFoodUseCase,
    required this.foodConsumptionUseCase,
  }) : super(TotalsInitial(foodCount!)) {
    getSavedLocalFoods();
  }

  Future<void> saveLocalFood(LocalConsumptionItem localFood) async {
    await saveLocalFoodUseCase.call(SaveLocalFoodParam(localFood));
    await saveFavoriteFoodUsecase.call(SaveFavoriteFoodParams(foodId: localFood.Id!));
    carbValue = carbValue! + localFood.CarbTotal!;

    foodsLocal!.add(localFood);
    emit(GetFoodsSuccess(foodsLocal!, foodsLocal!.length, carbValue: carbValue));
  }

  Future<void> updateLocalFood(LocalConsumptionItem localFood) async {
    await updateLocalFoodUseCase.call(UpdateLocalFoodParam(localFood));

    // final element = foodsLocal!.where((element) => element!.Index == localFood.Index).single;
    // final elementIndex = foodsLocal!.indexOf(element);
    // final
    foodsLocal![foodsLocal!.indexWhere((element) => element!.Index == localFood.Index)] = localFood;
    carbValue = 0;
    if (foodsLocal!.isNotEmpty) {
      for (var e in foodsLocal!) {
        carbValue = e!.CarbTotal! + carbValue!;
      }

      emit(GetFoodsSuccess(foodsLocal!, foodsLocal!.length, carbValue: carbValue));
    } else {
      emit(NoFoodState());
    }
  }

  Future<void> getSavedLocalFoods() async {
    foodsLocal = await getSavedLocalFoodsUseCase.call(const NoParams());

    if (foodsLocal!.isNotEmpty) {
      for (var e in foodsLocal!) {
        carbValue = e!.CarbTotal! + carbValue!;
      }

      emit(GetFoodsSuccess(foodsLocal!, foodsLocal!.length, carbValue: carbValue));
    } else {
      emit(NoFoodState());
    }
  }

  Future<void> deleteSingleFood(int foodIndex) async {
    await deleteSingleFoodUseCase.call(DeleteFoodParam(foodIndex));

    foodsLocal!.removeWhere((element) => element!.Index == foodIndex);
    carbValue = 0;
    if (foodsLocal!.isNotEmpty) {
      if (foodsLocal!.length > 1) {
        for (var e in foodsLocal!) {
          carbValue = carbValue! + e!.CarbTotal!;
        }
      } else {
        carbValue = foodsLocal![0]!.CarbTotal;
      }

      emit(GetFoodsSuccess(foodsLocal!, foodsLocal!.length, carbValue: carbValue));
    } else {
      emit(NoFoodState());
    }
  }

  Future<void> saveConsumption(
    List<LocalConsumptionItem?> localConsumptionList,
  ) async {
    emit(FoodConsumptionSaving());

    List<FoodForFoodConsumption> foodList = [];
    List<RecipeForFoodConsumption> recipeList = [];

    for (var e in localConsumptionList.where((element) => element!.ConsumptionType == 1)) {
      FoodForFoodConsumption foodForFoodConsumption = FoodForFoodConsumption(
        FoodId: e!.Id,
        UnitTypeId: e.UnitId,
        UserId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        Quantity: e.Quantity,
      );

      foodList.add(foodForFoodConsumption);
    }

    for (var r in localConsumptionList.where((element) => element!.ConsumptionType == 2)) {
      RecipeForFoodConsumption recipeForFoodConsumption = RecipeForFoodConsumption(
        recipeId: r!.Id,
        quantity: r.Quantity,
      );

      recipeList.add(recipeForFoodConsumption);
    }

    DateFormat formattedDate = DateFormat("yyyy-MM-dd HH:mm");
    DateTime consumptionDate = formattedDate.parse(DateTime.now().toString());

    FoodConsumption consumption = FoodConsumption(
      RecipeList: recipeList,
      FoodList: foodList,
      UserId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
      CreateDate: consumptionDate,
    );

    await foodConsumptionUseCase.call(SaveFoodConsumptionParams(consumption));
    emit(FoodConsumptionSavingSuccess());
    deleteAllFoods();
  }

  void deleteAllFoods() {
    deleteAllFoodsUseCase.call(const NoParams());
    foodsLocal!.clear();
    carbValue = 0;
    emit(NoFoodState());
  }
}
