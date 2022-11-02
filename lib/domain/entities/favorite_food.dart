import 'package:diyabet_app/data/datasources/remote/models/food/favorite_food_model.dart';

class FavoriteFood {
  final int? id;
  final int? foodId;
  final String? foodName;

  FavoriteFood({
    this.id,
    this.foodId,
    this.foodName,
  });

  FavoriteFoodModel toModel() => FavoriteFoodModel(id: id, foodId: foodId, foodName: foodName);
}
