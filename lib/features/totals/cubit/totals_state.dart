part of 'totals_cubit.dart';

abstract class TotalsState extends Equatable {
  const TotalsState();
}

class TotalsInitial extends TotalsState {
  final int foodCount;

  const TotalsInitial(this.foodCount);

  @override
  List<Object> get props => [foodCount];
}

class FoodSaveSuccess extends TotalsState {
  final double carbValue;

  const FoodSaveSuccess(this.carbValue);
  @override
  List<Object> get props => [carbValue];
}

class FoodSaveFailure extends TotalsState {
  final String? failureMessage;

  const FoodSaveFailure(this.failureMessage);

  @override
  List<Object> get props => [failureMessage!];
}

class GetFoodsSuccess extends TotalsState {
  final List<LocalConsumptionItem?> localSavedFoods;
  final int foodCount;
  final double? carbValue;

  const GetFoodsSuccess(this.localSavedFoods, this.foodCount, {this.carbValue});

  @override
  List<Object?> get props => [localSavedFoods, foodCount, carbValue];
}

class FoodsDeleted extends TotalsState {
  @override
  List<Object?> get props => [];
}

class NoFoodState extends TotalsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FoodConsumptionSaving extends TotalsState {
  @override
  List<Object> get props => [];
}

class FoodConsumptionSavingSuccess extends TotalsState {
  @override
  List<Object> get props => [];
}

class FoodConsumptionSavingFailure extends TotalsState {
  @override
  List<Object> get props => [];
}
