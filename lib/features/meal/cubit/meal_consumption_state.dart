part of 'meal_consumption_cubit.dart';

abstract class MealConsumptionState extends Equatable {
  const MealConsumptionState();
}

class MealConsumptionInitial extends MealConsumptionState {
  @override
  List<Object> get props => [];
}

class TodayMealConsumptionListLoading extends MealConsumptionState {
  @override
  List<Object?> get props => [];
}

class TodayMealConsumptionListLoadSuccess extends MealConsumptionState {
  final MealRoot? meal;

  const TodayMealConsumptionListLoadSuccess({this.meal});

  @override
  List<Object?> get props => [meal];
}

class TodayMealConsumptionListLoadFailure extends MealConsumptionState {
  final String? errorMessage;

  const TodayMealConsumptionListLoadFailure({this.errorMessage});

  @override
  List<Object?> get props => [];
}

class MealConsumptionFilterSuccess extends MealConsumptionState {
  final MealRoot? meal;

  const MealConsumptionFilterSuccess({this.meal});

  @override
  List<Object?> get props => [meal];
}

class MealConsumptionFilterFailure extends MealConsumptionState {
  final String? errorMessage;

  const MealConsumptionFilterFailure({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
