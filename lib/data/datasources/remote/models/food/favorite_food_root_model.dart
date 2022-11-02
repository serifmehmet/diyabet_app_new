import 'package:diyabet_app/data/datasources/remote/models/food/favorite_food_model.dart';
import 'package:diyabet_app/domain/entities/favorite_food_root.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'favorite_food_root_model.g.dart';

@JsonSerializable()
class FavoriteFoodRootModel extends INetworkModel<FavoriteFoodRootModel> {
  @JsonKey(defaultValue: [])
  List<FavoriteFoodModel>? favoriteFoods;
  String? errorCode;
  String? errorDescription;

  FavoriteFoodRootModel({
    this.favoriteFoods,
    this.errorCode,
    this.errorDescription,
  });

  @override
  factory FavoriteFoodRootModel.fromJson(Map<String, dynamic> json) {
    return _$FavoriteFoodRootModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$FavoriteFoodRootModelToJson(this);
  }

  @override
  FavoriteFoodRootModel fromJson(Map<String, dynamic> json) {
    return FavoriteFoodRootModel.fromJson(json);
  }

  FavoriteFoodRoot toEntity() =>
      FavoriteFoodRoot(favoriteFoods: favoriteFoods!.map((e) => e.toEntity()).toList(), errorCode: errorCode, errorDescription: errorDescription);
}
