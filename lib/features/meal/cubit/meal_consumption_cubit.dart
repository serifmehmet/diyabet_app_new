import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/base/error/error_object.dart';
import 'package:diyabet_app/domain/entities/meal.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/get_meal_by_filter_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../domain/usecases/food_consumption/params/get_meal_by_filter_params.dart';

part 'meal_consumption_state.dart';
part 'meal_consumption_cubit.freezed.dart';

class MealConsumptionCubit extends Cubit<MealConsumptionState> {
  MealConsumptionCubit({
    required this.getMealByFilterUseCase,
  }) : super(
          const MealConsumptionState.initial(),
        );

  final GetMealByFilterUseCase getMealByFilterUseCase;

  Future<void> getTodayMealList() async {
    emit(const ConsumptionListLoading());
    final mealList = await getMealByFilterUseCase
        .call(GetMealByFilterParams(CacheManager.instance.getIntValue(PreferencesKeys.USERID), DateTime.now()));

    mealList.fold<void>(
      (failure) {
        emit(
          ConsumptionListLoadFailure(
            errorObject: ErrorObject.mapFailureToErrorObject(failure: failure),
          ),
        );
      },
      (mealList) {
        if (mealList.meals!.isNotEmpty) {
          final meals = mealList.meals!;
          meals.sort(
            (a, b) {
              return b.mealDate!.compareTo(a.mealDate!);
            },
          );
          emit(ConsumptionListLoaded(mealList: meals));
        } else {
          emit(
            const ConsumptionListLoadFailure(
              errorObject: ErrorObject(
                errorType: ErrorType.returnedNothing,
                errorMessage: "Bugüne ait hesaplanmış besin tüketiminiz bulunmuyor",
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> filterDateChanged(DateTime selectedDate) async {
    emit(const ConsumptionListLoading());
    final mealList = await getMealByFilterUseCase
        .call(GetMealByFilterParams(CacheManager.instance.getIntValue(PreferencesKeys.USERID), selectedDate));

    mealList.fold<void>(
      (failure) {
        emit(
          FilterFailure(
            errorObject: ErrorObject.mapFailureToErrorObject(failure: failure),
          ),
        );
      },
      (mealList) {
        if (mealList.meals!.isNotEmpty) {
          final meals = mealList.meals!;
          meals.sort(
            (a, b) {
              return b.mealDate!.compareTo(a.mealDate!);
            },
          );
          emit(ConsumptionListLoaded(mealList: meals));
        } else {
          emit(
            const ConsumptionListLoadFailure(
              errorObject: ErrorObject(
                errorType: ErrorType.returnedNothing,
                errorMessage: "Bugüne ait hesaplanmış besin tüketiminiz bulunmuyor",
              ),
            ),
          );
        }
      },
    );
  }
}
