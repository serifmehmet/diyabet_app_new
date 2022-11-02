import 'package:diyabet_app/domain/entities/favorite_food.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'favorite_food_model.g.dart';

@JsonSerializable()
class FavoriteFoodModel extends INetworkModel<FavoriteFoodModel> {
  int? id;
  int? foodId;
  String? foodName;

  FavoriteFoodModel({
    this.id,
    this.foodId,
    this.foodName,
  });

  @override
  factory FavoriteFoodModel.fromJson(Map<String, dynamic> json) {
    return _$FavoriteFoodModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$FavoriteFoodModelToJson(this);
  }

  @override
  FavoriteFoodModel fromJson(Map<String, dynamic> json) {
    return FavoriteFoodModel.fromJson(json);
  }

  FavoriteFood toEntity() => FavoriteFood(id: id, foodId: foodId, foodName: foodName);
}
