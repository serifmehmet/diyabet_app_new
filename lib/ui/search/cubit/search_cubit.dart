import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/food.dart';
import '../../../domain/usecases/food/get_food_on_name_usecase.dart';
import '../../../domain/usecases/food/params/get_food_param.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetFoodOnNameUseCase? searchUseCase;
  SearchCubit({
    this.searchUseCase,
  }) : super(SearchInitial());

  late Food _food;
  Future<void> getSearchItem(String foodName) async {
    emit(Searching());
    final response = await searchUseCase?.call(GetFoodParam(foodName));

    if (response != null) {
      if (response.items!.isNotEmpty) {
        _food = response;
        emit(SearchSuccess(_food));
      } else {
        emit(const SearchFailure("No food found"));
      }
    } else {
      emit(const SearchFailure("No food found"));
    }
  }

  clearSearch() {
    emit(SearchInitial());
  }
}
