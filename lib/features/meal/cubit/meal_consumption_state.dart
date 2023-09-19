part of 'meal_consumption_cubit.dart';

@freezed
class MealConsumptionState with _$MealConsumptionState {
  const factory MealConsumptionState.initial() = _Initial;
  const factory MealConsumptionState.consumptionListLoading() = ConsumptionListLoading;
  const factory MealConsumptionState.consumptionListLoaded({required List<Meal>? mealList}) = ConsumptionListLoaded;
  const factory MealConsumptionState.consumptionListLoadFailure({required ErrorObject errorObject}) =
      ConsumptionListLoadFailure;

  const factory MealConsumptionState.filterSuccess({required List<Meal>? mealList}) = FilterSuccess;
  const factory MealConsumptionState.filterFailure({required ErrorObject errorObject}) = FilterFailure;
}
