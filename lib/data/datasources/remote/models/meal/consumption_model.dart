import 'package:diyabet_app/domain/entities/consumption.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'consumption_model.g.dart';

@JsonSerializable()
class ConsumptionModel extends INetworkModel<ConsumptionModel> {
  String? name;

  String? unitName;
  int? quantity;
  double? totalCarb;

  ConsumptionModel({
    this.name,
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
        name: name,
        unitName: unitName,
        quantity: quantity,
        totalCarb: totalCarb,
      );
}
