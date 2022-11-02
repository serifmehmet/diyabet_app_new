import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/base/error/error_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/base/error/failure.dart';
import '../../../domain/entities/cache_food_list_item.dart';
import '../../../domain/usecases/cache_food/get_foods_from_cache_on_name.dart';
import '../../../domain/usecases/cache_food/params/search_cache_food_params.dart';

part 'recipe_food_search_state.dart';
part 'recipe_food_search_cubit.freezed.dart';

class RecipeFoodSearchCubit extends Cubit<RecipeFoodSearchState> {
  RecipeFoodSearchCubit({required GetFoodsFromCacheOnName getFoodsFromCacheOnName})
      : _getFoodsFromCacheOnName = getFoodsFromCacheOnName,
        super(const RecipeFoodSearchState.initial());

  final GetFoodsFromCacheOnName _getFoodsFromCacheOnName;

  late List<CacheFoodListItem> _cacheFoodListItem = [];
  //! Search Operations
  Future<void> searchFoodItemForRecipe(String foodName) async {
    emit(const _Loading());
    try {
      final response = await _getFoodsFromCacheOnName.call(SearchCacheFoodParams(foodName));

      if (response!.isNotEmpty) {
        _cacheFoodListItem = response;
        emit(_Success(foodList: _cacheFoodListItem));
      } else {
        emit(_Failure(errorObject: ErrorObject.mapFailureToErrorObject(failure: const ItemNotFoundError("besin"))));
      }
    } catch (e) {}
  }

  void clearFoodSearch() {
    _cacheFoodListItem = [];
    emit(const _Initial());
  }
}
