import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_for_food_consumption_model.dart';
import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'food_consumption_model.g.dart';

@JsonSerializable()
class FoodConsumptionModel extends INetworkModel<FoodConsumptionModel> {
  int? id;
  List<FoodForFoodConsumptionModel>? foodList;
  DateTime? createDate;

  FoodConsumptionModel({
    this.id,
    this.foodList,
    this.createDate,
  });

  @override
  factory FoodConsumptionModel.fromJson(Map<String, dynamic> json) {
    return _$FoodConsumptionModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$FoodConsumptionModelToJson(this);
  }

  @override
  FoodConsumptionModel fromJson(Map<String, dynamic> json) {
    return FoodConsumptionModel.fromJson(json);
  }

  FoodConsumption toEntity() => FoodConsumption(
        Id: id,
        FoodList: foodList!.map((e) => e.toEntity()).toList(),
        CreateDate: createDate,
      );
}
