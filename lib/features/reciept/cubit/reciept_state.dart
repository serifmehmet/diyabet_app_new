part of 'reciept_cubit.dart';

enum FoodSearchStatus { initial, success, failure, loading }

enum RecipeStatus { initial, success, failure, loading, addFoodSuccess }

// abstract class RecieptState extends Equatable {
//   const RecieptState();
// }

class FoodSearchState extends Equatable {
  final List<CacheFoodListItem> foodList;
  final FoodSearchStatus status;
  final Exception? exception;

  const FoodSearchState({
    this.status = FoodSearchStatus.initial,
    this.foodList = const [],
    this.exception,
  });

  FoodSearchState copyWith({FoodSearchStatus? status, List<CacheFoodListItem>? foodList, Exception? exception}) {
    return FoodSearchState(
      status: status ?? this.status,
      foodList: foodList ?? this.foodList,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, foodList, exception];
}

class RecipeState extends Equatable {
  final List<LocalFood> foodsAdded;
  final RecipeStatus status;
  final Exception? exception;

  const RecipeState({
    this.status = RecipeStatus.initial,
    this.foodsAdded = const [],
    this.exception,
  });

  RecipeState copyWith({RecipeStatus? status, List<LocalFood>? foodsAdded, Exception? exception}) {
    return RecipeState(status: status ?? this.status, foodsAdded: foodsAdded ?? this.foodsAdded, exception: exception ?? this.exception);
  }

  @override
  List<Object?> get props => [status, foodsAdded, exception];
}

// class RecieptInitial extends RecieptState {
//   @override
//   List<Object> get props => [];
// }

// class RecieptSearch extends RecieptState {
//   @override
//   List<Object> get props => [];
// }

// class RecieptSearchSuccess extends RecieptState {
//   final List<CacheFoodListItem?> foodList;

//   const RecieptSearchSuccess(this.foodList);

//   @override
//   List<Object> get props => [foodList];
// }

// class RecieptSearchInitial extends RecieptState {
//   @override
//   List<Object?> get props => [];
// }

// class RecieptSearchFailure extends RecieptState {
//   final String message;

//   const RecieptSearchFailure(this.message);

//   @override
//   List<Object> get props => [message];
// }

// class AddReceiptSuccess extends RecieptState {
//   @override
//   List<Object?> get props => [];
// }

// class AddFoodToReceiptSuccess extends RecieptState {
//   final List<LocalFood?> foodsAdded;

//   const AddFoodToReceiptSuccess({required this.foodsAdded});
//   @override
//   List<Object?> get props => [foodsAdded];
// }
