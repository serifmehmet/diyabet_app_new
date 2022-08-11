import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/cache_food_list_item.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:diyabet_app/domain/usecases/cache_food/get_foods_from_cache_on_name.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/cache_food/params/search_cache_food_params.dart';

part 'reciept_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(const RecipeState());
  late final List<LocalFood> _foodsAddedToReceipt = [];

  void saveLocalFoodToReceipt(LocalFood foodToAdd) {
    _foodsAddedToReceipt.add(foodToAdd);
    emit(state.copyWith(status: RecipeStatus.addFoodSuccess, foodsAdded: _foodsAddedToReceipt));
  }

  void closeSearchResultBox() {
    emit(state.copyWith(status: RecipeStatus.initial));
  }
}

class FoodSearchCubit extends Cubit<FoodSearchState> {
  final GetFoodsFromCacheOnName? searchFoodUseCase;

  FoodSearchCubit({this.searchFoodUseCase}) : super(const FoodSearchState());

  late List<CacheFoodListItem>? _cacheFoodListItem;

  Future<void> searchFoodItemForReciept(String foodName) async {
    emit(state.copyWith(status: FoodSearchStatus.loading));
    try {
      final response = await searchFoodUseCase?.call(SearchCacheFoodParams(foodName));

      if (response!.isNotEmpty) {
        _cacheFoodListItem = response;
        emit(
          state.copyWith(
            status: FoodSearchStatus.success,
            foodList: _cacheFoodListItem!,
          ),
        );
      } else {
        emit(state.copyWith(status: FoodSearchStatus.failure, exception: Exception("Aradığınız besin bulunamadı!")));
      }
    } on Exception catch (exception) {
      emit(state.copyWith(status: FoodSearchStatus.failure, exception: exception));
    }
  }

  void clearFoodSeach() {
    emit(state.copyWith(status: FoodSearchStatus.initial));
  }
}
