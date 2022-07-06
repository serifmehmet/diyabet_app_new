import 'package:diyabet_app/data/datasources/remote/models/meal/consumption_model.dart';
import 'package:diyabet_app/domain/entities/meal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class MealModel extends INetworkModel<MealModel> {
  int? mealId;
  DateTime? mealDate;
  double? bolusValue;
  double? totalCarb;
  List<ConsumptionModel>? consumptions;

  MealModel({
    this.mealId,
    this.mealDate,
    this.bolusValue,
    this.totalCarb,
    this.consumptions,
  });

  @override
  factory MealModel.fromJson(Map<String, dynamic> json) {
    return _$MealModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$MealModelToJson(this);
  }

  @override
  MealModel fromJson(Map<String, dynamic> json) {
    return MealModel.fromJson(json);
  }

  Meal toEntity() => Meal(
        mealId: mealId,
        mealDate: mealDate,
        bolusValue: bolusValue,
        totalCarb: totalCarb,
        consumptions: consumptions!.map((e) => e.toEntity()).toList(),
      );
}
