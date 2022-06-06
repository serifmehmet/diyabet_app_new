import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/meal_root.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../domain/usecases/food_consumption/get_meal_by_filter_usecase.dart';
import '../../../domain/usecases/food_consumption/params/get_meal_by_filter_params.dart';

part 'meal_consumption_state.dart';

class MealConsumptionCubit extends Cubit<MealConsumptionState> {
  MealConsumptionCubit({required this.getMealByFilterUseCase}) : super(MealConsumptionInitial()) {
    getTodayMealList();
  }

  final GetMealByFilterUseCase getMealByFilterUseCase;

  Future<void> getTodayMealList() async {
    emit(TodayMealConsumptionListLoading());
    final mealList =
        await getMealByFilterUseCase.call(GetMealByFilterParams(CacheManager.instance.getIntValue(PreferencesKeys.USERID), DateTime.now()));

    if (mealList!.meals!.isNotEmpty) {
      emit(TodayMealConsumptionListLoadSuccess(meal: mealList));
    } else {
      emit(const TodayMealConsumptionListLoadFailure(errorMessage: "Bugüne ait hesaplanmış besin tüketiminiz bulunmuyor."));
    }
  }

  Future<void> filterDateChanged(DateTime selectedDate) async {
    emit(TodayMealConsumptionListLoading());
    final mealList =
        await getMealByFilterUseCase.call(GetMealByFilterParams(CacheManager.instance.getIntValue(PreferencesKeys.USERID), selectedDate));

    if (mealList!.meals!.isNotEmpty) {
      emit(MealConsumptionFilterSuccess(meal: mealList));
    } else {
      emit(const MealConsumptionFilterFailure(errorMessage: "Bugüne ait hesaplanmış besin tüketiminiz bulunmuyor."));
    }
  }
}
