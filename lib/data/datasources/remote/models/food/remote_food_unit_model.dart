import 'package:diyabet_app/domain/entities/remote_food.dart';
import 'package:diyabet_app/domain/entities/remote_food_unit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'remote_food_unit_model.g.dart';

@JsonSerializable()
class RemoteFoodUnitModel extends INetworkModel<RemoteFoodUnitModel> {
  int? id;
  String? unitName;
  int? foodId;
  int? unitId;
  double? carbValue;

  RemoteFoodUnitModel({this.id, this.unitName, this.foodId, this.unitId, this.carbValue});

  @override
  factory RemoteFoodUnitModel.fromJson(Map<String, dynamic> json) {
    return _$RemoteFoodUnitModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RemoteFoodUnitModelToJson(this);
  }

  @override
  RemoteFoodUnitModel fromJson(Map<String, dynamic> json) {
    return RemoteFoodUnitModel.fromJson(json);
  }

  RemoteFoodUnit toEntity() => RemoteFoodUnit(
        Id: id,
        UnitName: unitName,
        UnitId: unitId,
        FoodId: foodId,
        CarbValue: carbValue,
      );
}
