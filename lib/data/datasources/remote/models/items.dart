import 'package:diyabet_app/domain/entities/items.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'items.g.dart';

@JsonSerializable()
class ItemsModel extends INetworkModel<ItemsModel> {
  @JsonKey(disallowNullValue: true, name: "sugar_g")
  double? sugarG;

  @JsonKey(disallowNullValue: true, name: "fiber_g")
  double? fiberG;

  @JsonKey(disallowNullValue: true, name: "serving_size_g")
  double? servingSizeG;

  @JsonKey(disallowNullValue: true, name: "sodium_mg")
  int? sodiumMg;

  @JsonKey(disallowNullValue: true, name: "name")
  String? name;

  @JsonKey(disallowNullValue: true, name: "potassium_mg")
  int? potassiumMg;

  @JsonKey(disallowNullValue: true, name: "fat_saturated_g")
  double? fatSaturatedG;

  @JsonKey(disallowNullValue: true, name: "fat_total_g")
  double? fatTotalG;

  @JsonKey(disallowNullValue: true, name: "calories")
  double? calories;

  @JsonKey(disallowNullValue: true, name: "cholesterol_mg")
  int? cholesterolMg;

  @JsonKey(disallowNullValue: true, name: "protein_g")
  double? proteinG;

  @JsonKey(disallowNullValue: true, name: "carbohydrates_total_g")
  double? carbohydratesTotalG;

  ItemsModel({
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
    return _$ItemsModelToJson(this);
  }

  @override
  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return _$ItemsModelFromJson(json);
  }

  Items toEntity() => Items(
        calories: calories,
        carbohydratesTotalG: carbohydratesTotalG,
        cholesterolMg: cholesterolMg,
        fatSaturatedG: fatSaturatedG,
        fatTotalG: fatTotalG,
        fiberG: fiberG,
        name: name,
        potassiumMg: potassiumMg,
        proteinG: proteinG,
        servingSizeG: servingSizeG,
        sodiumMg: sodiumMg,
        sugarG: sugarG,
      );

  @override
  ItemsModel fromJson(Map<String, dynamic> json) {
    return ItemsModel.fromJson(json);
  }
}
