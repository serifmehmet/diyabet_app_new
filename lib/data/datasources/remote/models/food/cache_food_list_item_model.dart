import 'package:diyabet_app/data/datasources/local/models/food_to_cache_hive_model.dart';
import 'package:diyabet_app/domain/entities/cache_food_list_item.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'cache_food_list_item_model.g.dart';

@JsonSerializable()
class CacheFoodListItemModel extends INetworkModel<CacheFoodListItemModel> {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  CacheFoodListItemModel({
    this.id,
    this.name,
  });

  @override
  factory CacheFoodListItemModel.fromJson(Map<String, dynamic> json) {
    return _$CacheFoodListItemModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$CacheFoodListItemModelToJson(this);
  }

  @override
  CacheFoodListItemModel fromJson(Map<String, dynamic> json) {
    return CacheFoodListItemModel.fromJson(json);
  }

  CacheFoodListItem toEntity() => CacheFoodListItem(Id: id, Name: name);

  FoodToCacheHiveModel toHiveModel() => FoodToCacheHiveModel()
    ..id = id!
    ..name = name!;
}
