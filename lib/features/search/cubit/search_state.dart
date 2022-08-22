part of 'search_cubit.dart';

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  final List<CacheFoodListItem> foodList;
  final SearchStatus status;
  final Exception? exception;

  const SearchState({this.status = SearchStatus.initial, this.foodList = const [], this.exception});

  SearchState copyWith({SearchStatus? status, List<CacheFoodListItem>? foodList, Exception? exception}) {
    return SearchState(
      status: status ?? this.status,
      foodList: foodList ?? this.foodList,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, foodList, exception];
}

// abstract class SearchState extends Equatable {
//   const SearchState();
// }

// class SearchInitial extends SearchState {
//   @override
//   List<Object> get props => [];
// }

// class SearchSuccess extends SearchState {
//   final List<CacheFoodListItem?> cacheFoodListItem;

//   const SearchSuccess(this.cacheFoodListItem);

//   @override
//   List<Object> get props => [];
// }

// class Searching extends SearchState {
//   @override
//   List<Object> get props => [];
// }

// class SearchFailure extends SearchState {
//   final String message;

//   const SearchFailure(this.message);

//   @override
//   List<Object> get props => [];
// }
