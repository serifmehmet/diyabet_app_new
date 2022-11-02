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
