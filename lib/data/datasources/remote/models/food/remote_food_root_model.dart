import 'package:diyabet_app/data/datasources/remote/models/food/remote_food_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/food/remote_food_unit_model.dart';

import 'package:diyabet_app/domain/entities/remote_food_root.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'remote_food_root_model.g.dart';

@JsonSerializable()
class RemoteFoodRootModel extends INetworkModel<RemoteFoodRootModel> {
  RemoteFoodModel? food;
  List<RemoteFoodUnitModel>? foodUnits;
  String? errorCode;

  RemoteFoodRootModel({
    this.food,
    this.foodUnits,
    this.errorCode,
  });

  @override
  factory RemoteFoodRootModel.fromJson(Map<String, dynamic> json) {
    return _$RemoteFoodRootModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RemoteFoodRootModelToJson(this);
  }

  @override
  RemoteFoodRootModel fromJson(Map<String, dynamic> json) {
    return RemoteFoodRootModel.fromJson(json);
  }

  RemoteFoodRoot toEntity() => RemoteFoodRoot(
        ErrorCode: errorCode,
        Food: food!.toEntity(),
        FoodUnits: foodUnits!.map((e) => e.toEntity()).toList(),
      );
}
