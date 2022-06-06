import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:diyabet_app/domain/entities/food_for_food_consumption.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/get_meal_by_filter_usecase.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/params/get_meal_by_filter_params.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/params/save_food_consumption_params.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/save_food_consumption_usecase.dart';
import 'package:equatable/equatable.dart';

part 'food_consumption_state.dart';

class FoodConsumptionCubit extends Cubit<FoodConsumptionState> {
  FoodConsumptionCubit({required this.getMealByFilterUseCase}) : super(FoodConsumptionInitial()) {
    getTodayMealList();
  }

  final GetMealByFilterUseCase getMealByFilterUseCase;

  Future<void> getTodayMealList() async {
    final mealList =
        await getMealByFilterUseCase.call(GetMealByFilterParams(CacheManager.instance.getIntValue(PreferencesKeys.USERID), DateTime.now()));
  }
}
