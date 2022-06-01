import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:diyabet_app/domain/usecases/food/delete_all_foods_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/delete_single_food_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/get_saved_local_foods_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/params/delete_food_param.dart';
import 'package:diyabet_app/domain/usecases/food/params/save_local_food_param.dart';
import 'package:diyabet_app/domain/usecases/food/params/update_local_food_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/save_local_food_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/update_local_food_usecase.dart';
import 'package:equatable/equatable.dart';

part 'totals_state.dart';

class TotalsCubit extends Cubit<TotalsState> {
  final SaveLocalFoodUseCase saveLocalFoodUseCase;
  final GetSavedLocalFoodsUseCase getSavedLocalFoodsUseCase;
  final DeleteAllFoodsUseCase deleteAllFoodsUseCase;
  final DeleteSingleFoodUseCase deleteSingleFoodUseCase;
  final UpdateLocalFoodUseCase updateLocalFoodUseCase;
  int? foodCount;
  double? carbValue;
  List<LocalFood?>? foodsLocal;

  TotalsCubit(
    this.foodCount,
    this.carbValue, {
    this.foodsLocal,
    required this.deleteAllFoodsUseCase,
    required this.saveLocalFoodUseCase,
    required this.getSavedLocalFoodsUseCase,
    required this.deleteSingleFoodUseCase,
    required this.updateLocalFoodUseCase,
  }) : super(TotalsInitial(foodCount!)) {
    getSavedLocalFoods();
  }

  Future<void> saveLocalFood(LocalFood localFood) async {
    await saveLocalFoodUseCase.call(SaveLocalFoodParam(localFood));
    carbValue = carbValue! + localFood.CarbTotal!;

    foodsLocal!.add(localFood);
    emit(GetFoodsSuccess(foodsLocal!, foodsLocal!.length, carbValue: carbValue));
  }

  Future<void> updateLocalFood(LocalFood localFood) async {
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

  void deleteAllFoods() {
    deleteAllFoodsUseCase.call(const NoParams());
    foodsLocal!.clear();
    carbValue = 0;
    emit(NoFoodState());
  }
}
