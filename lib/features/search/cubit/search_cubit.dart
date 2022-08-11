import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/cache_food_list_item.dart';
import '../../../domain/usecases/cache_food/get_foods_from_cache_on_name.dart';
import '../../../domain/usecases/cache_food/params/search_cache_food_params.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetFoodsFromCacheOnName? getFoodFromCacheUseCase;

  SearchCubit({this.getFoodFromCacheUseCase}) : super(const SearchState());

  late List<CacheFoodListItem>? _cacheFoodListItem;
  Future<void> getSearchItem(String foodName) async {
    emit(state.copyWith(status: SearchStatus.loading));
    final response = await getFoodFromCacheUseCase!.call(SearchCacheFoodParams(foodName));

    if (response!.isNotEmpty) {
      //TO-DO: response modeli entity'e dönmeli
      _cacheFoodListItem = response;
      emit(state.copyWith(status: SearchStatus.success, foodList: _cacheFoodListItem));
    } else {
      emit(state.copyWith(status: SearchStatus.failure, exception: Exception("Aradığınız besin bulunamadı!")));
    }
    // if (response != null) {
    //   if (response.items!.isNotEmpty) {
    //     _food = response;
    //     emit(SearchSuccess(_food));
    //   } else {
    //     emit(const SearchFailure("No food found"));
    //   }
    // } else {
    //   emit(const SearchFailure("No food found"));
    // }
  }

  clearSearch() {
    emit(state.copyWith(status: SearchStatus.initial));
  }
}
