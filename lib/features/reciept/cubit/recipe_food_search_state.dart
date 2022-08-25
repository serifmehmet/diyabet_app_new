part of 'recipe_food_search_cubit.dart';

@freezed
class RecipeFoodSearchState with _$RecipeFoodSearchState {
  const factory RecipeFoodSearchState.initial() = _Initial;
  const factory RecipeFoodSearchState.loading() = _Loading;
  const factory RecipeFoodSearchState.success({required List<CacheFoodListItem> foodList}) = _Success;
  const factory RecipeFoodSearchState.failure({required ErrorObject errorObject}) = _Failure;
}
