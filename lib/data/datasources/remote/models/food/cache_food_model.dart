import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../../../../domain/entities/cache_food.dart';

import '../../../local/models/food_cache_hive_model.dart';

import 'cache_food_list_item_model.dart';

part "cache_food_model.g.dart";

@JsonSerializable()
class CacheFoodModel extends INetworkModel<CacheFoodModel> {
  @JsonKey(name: "foodList")
  List<CacheFoodListItemModel>? foodList;
  @JsonKey(name: "errorCode")
  String? errorCode;

  CacheFoodModel({
    this.foodList,
    this.errorCode,
  });

  @override
  factory CacheFoodModel.fromJson(Map<String, dynamic> json) {
    return _$CacheFoodModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$CacheFoodModelToJson(this);
  }

  CacheFood toEntity() => CacheFood(
        FoodList: foodList!.map((e) => e.toEntity()).toList(),
        ErrorCode: errorCode,
      );

  @override
  CacheFoodModel fromJson(Map<String, dynamic> json) {
    return CacheFoodModel.fromJson(json);
  }

  FoodCacheHiveModel toHiveModel() => FoodCacheHiveModel()
    ..foodList = foodList!.map((e) => e.toHiveModel()).toList()
    ..errorCode = errorCode!;
}
