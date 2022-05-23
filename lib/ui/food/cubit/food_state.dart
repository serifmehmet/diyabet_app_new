part of 'food_cubit.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object?> get props => [];
}

class FoodInitial extends FoodState {}

class SingleFoodLoading extends FoodState {
  @override
  List<Object?> get props => [];
}

class SingleFoodLoadSuccess extends FoodState {
  final RemoteFoodRoot? remoteFood;

  const SingleFoodLoadSuccess(this.remoteFood);

  @override
  List<Object?> get props => [];
}

class SingleFoodLoadFailure extends FoodState {
  final String? errorMessage;

  const SingleFoodLoadFailure(this.errorMessage);

  @override
  List<Object?> get props => [];
}
