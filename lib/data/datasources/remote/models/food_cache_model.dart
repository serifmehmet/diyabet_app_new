import 'package:diyabet_app/data/datasources/local/models/food_cache_hive_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/food_on_cache_model.dart';
import 'package:diyabet_app/domain/entities/food_on_cache.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../../../domain/entities/food_cache.dart';

part "food_cache_model.g.dart";

@JsonSerializable()
class FoodCacheModel extends INetworkModel<FoodCacheModel> {
  @JsonKey(name: "foodList")
  List<FoodOnCacheModel>? FoodOnCache;
  @JsonKey(name: "errorCode")
  String? ErrorCode;

  FoodCacheModel({
    this.FoodOnCache,
    this.ErrorCode,
  });

  @override
  factory FoodCacheModel.fromJson(Map<String, dynamic> json) {
    return _$FoodCacheModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$FoodCacheModelToJson(this);
  }

  FoodCache toEntity() => FoodCache(
        FoodList: FoodOnCache!.map((e) => e.toEntity()).toList(),
        ErrorCode: ErrorCode,
      );

  @override
  FoodCacheModel fromJson(Map<String, dynamic> json) {
    return FoodCacheModel.fromJson(json);
  }

  FoodCacheHiveModel toHiveModel() => FoodCacheHiveModel()
    ..foodList = FoodOnCache!.map((e) => e.toHiveModel()).toList()
    ..errorCode = ErrorCode!;
}
