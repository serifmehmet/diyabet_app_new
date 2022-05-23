part of 'food_unit_cubit.dart';

abstract class FoodUnitState extends Equatable {
  const FoodUnitState();
}

class FoodUnitInitial extends FoodUnitState {
  @override
  List<Object> get props => [];
}

class SelectedUnitChanged extends FoodUnitState {
  final RemoteFoodUnit? selectedFoodUnit;

  const SelectedUnitChanged(this.selectedFoodUnit);

  @override
  List<Object> get props => [selectedFoodUnit!];
}
