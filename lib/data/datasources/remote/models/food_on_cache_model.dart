import 'package:diyabet_app/domain/entities/food_on_cache.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'food_on_cache_model.g.dart';

@JsonSerializable()
class FoodOnCacheModel extends INetworkModel<FoodOnCacheModel> {
  @JsonKey(name: "id")
  double? Id;
  @JsonKey(name: "name")
  String? Name;

  FoodOnCacheModel({
    this.Id,
    this.Name,
  });

  @override
  factory FoodOnCacheModel.fromJson(Map<String, dynamic> json) {
    return _$FoodOnCacheModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$FoodOnCacheModelToJson(this);
  }

  @override
  FoodOnCacheModel fromJson(Map<String, dynamic> json) {
    return FoodOnCacheModel.fromJson(json);
  }

  FoodOnCache toEntity() => FoodOnCache(
        Id: Id,
        Name: Name,
      );
}
