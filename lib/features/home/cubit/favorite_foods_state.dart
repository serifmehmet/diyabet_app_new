part of 'favorite_foods_cubit.dart';

@freezed
class FavoriteFoodsState with _$FavoriteFoodsState {
  const factory FavoriteFoodsState.loading() = Loading;
  const factory FavoriteFoodsState.emptyFavoriteFoods({required String emptyListMessage}) = EmptyFavoriteFoods;
  const factory FavoriteFoodsState.favoriteFoodsLoaded({required FavoriteFoodRoot favoriteFood}) = FavoriteFoodsLoaded;
}
