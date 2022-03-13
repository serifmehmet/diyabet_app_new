import 'package:diyabet_app/domain/entities/food.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'food.g.dart';

@JsonSerializable()
class FoodModel extends INetworkModel<FoodModel> {
  double? sugarG;
  double? fiberG;
  int? servingSizeG;
  int? sodiumMg;
  String? name;
  int? potassiumMg;
  int? fatSaturatedG;
  double? fatTotalG;
  int? calories;
  int? cholesterolMg;
  double? proteinG;
  double? carbohydratesTotalG;

  FoodModel({
    this.sugarG,
    this.fiberG,
    this.servingSizeG,
    this.sodiumMg,
    this.name,
    this.potassiumMg,
    this.fatSaturatedG,
    this.fatTotalG,
    this.calories,
    this.cholesterolMg,
    this.proteinG,
    this.carbohydratesTotalG,
  });

  @override
  Map<String, dynamic> toJson() {
    return _$FoodModelToJson(this);
  }

  @override
  FoodModel fromJson(Map<String, dynamic> json) {
    return _$FoodModelFromJson(json);
  }

  Food toEntity() => Food(
      sugarG: sugarG,
      fiberG: fiberG,
      servingSizeG: servingSizeG,
      sodiumMg: sodiumMg,
      name: name,
      potassiumMg: potassiumMg,
      fatSaturatedG: fatSaturatedG,
      fatTotalG: fatTotalG,
      calories: calories,
      cholesterolMg: cholesterolMg,
      proteinG: proteinG,
      carbohydratesTotalG: carbohydratesTotalG);
}
