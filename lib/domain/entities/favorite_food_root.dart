import 'package:diyabet_app/data/datasources/remote/models/food/favorite_food_root_model.dart';
import 'package:diyabet_app/domain/entities/favorite_food.dart';

class FavoriteFoodRoot {
  final List<FavoriteFood>? favoriteFoods;
  final String? errorCode;
  final String? errorDescription;

  FavoriteFoodRoot({
    this.favoriteFoods,
    this.errorCode,
    this.errorDescription,
  });

  FavoriteFoodRootModel toModel() => FavoriteFoodRootModel(
        favoriteFoods: favoriteFoods!.map((e) => e.toModel()).toList(),
        errorCode: errorCode,
        errorDescription: errorDescription,
      );
}
