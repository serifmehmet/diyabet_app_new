part of 'food_unit_cubit.dart';

abstract class FoodUnitState extends Equatable {
  RemoteFoodUnit? selectedFoodUnit;
  FoodUnitState({this.selectedFoodUnit});
}

class FoodUnitInitial extends FoodUnitState {
  final RemoteFoodUnit? foodUnit;

  FoodUnitInitial(this.foodUnit);

  @override
  List<Object> get props => [foodUnit!];
}

class SelectedUnitChanged extends FoodUnitState {
  final double? newCarbValue;

  SelectedUnitChanged(this.newCarbValue);

  @override
  List<Object> get props => [newCarbValue!];
}

class SelectedQuantityChanged extends FoodUnitState {
  final double? newCarbValue;

  SelectedQuantityChanged(this.newCarbValue);

  @override
  List<Object> get props => [newCarbValue!];
}
