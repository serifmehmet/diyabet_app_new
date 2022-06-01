part of 'food_consumption_cubit.dart';

abstract class FoodConsumptionState extends Equatable {
  const FoodConsumptionState();
}

class FoodConsumptionInitial extends FoodConsumptionState {
  @override
  List<Object> get props => [];
}

class FoodConsumotionSaving extends FoodConsumptionState {
  @override
  List<Object> get props => [];
}

class FoodConsumptionSavingSuccess extends FoodConsumptionState {
  @override
  List<Object> get props => [];
}

class FoodConsumptionSavingFailure extends FoodConsumptionState {
  @override
  List<Object> get props => [];
}
