part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchSuccess extends SearchState {
  final List<CacheFoodListItem?> cacheFoodListItem;

  const SearchSuccess(this.cacheFoodListItem);

  @override
  List<Object> get props => [];
}

class Searching extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchFailure extends SearchState {
  final String message;

  const SearchFailure(this.message);

  @override
  List<Object> get props => [];
}
