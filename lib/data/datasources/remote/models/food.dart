import 'package:diyabet_app/data/datasources/remote/models/items.dart';
import 'package:diyabet_app/domain/entities/food.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'food.g.dart';

@JsonSerializable()
class FoodModel extends INetworkModel<FoodModel> {
  List<ItemsModel>? items;

  FoodModel({this.items});

  @override
  Map<String, dynamic> toJson() {
    return _$FoodModelToJson(this);
  }

  @override
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return _$FoodModelFromJson(json);
  }

  Food toEntity() => Food(
        items: items != null ? items?.map((item) => item.toEntity()).toList() : null,
      );

  @override
  FoodModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return FoodModel.fromJson(json);
  }
}
