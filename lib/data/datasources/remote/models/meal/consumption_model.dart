import 'package:diyabet_app/domain/entities/consumption.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'consumption_model.g.dart';

@JsonSerializable()
class ConsumptionModel extends INetworkModel<ConsumptionModel> {
  int? foodId;
  String? foodName;
  int? unitId;
  String? unitName;
  int? quantity;
  double? totalCarb;

  ConsumptionModel({
    this.foodId,
    this.foodName,
    this.unitId,
    this.unitName,
    this.quantity,
    this.totalCarb,
  });

  @override
  factory ConsumptionModel.fromJson(Map<String, dynamic> json) {
    return _$ConsumptionModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ConsumptionModelToJson(this);
  }

  @override
  ConsumptionModel fromJson(Map<String, dynamic> json) {
    return ConsumptionModel.fromJson(json);
  }

  Consumption toEntity() => Consumption(
        foodId: foodId,
        foodName: foodName,
        unitId: unitId,
        unitName: unitName,
        quantity: quantity,
        totalCarb: totalCarb,
      );
}
