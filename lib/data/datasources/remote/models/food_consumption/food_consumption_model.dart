import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_for_food_consumption_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/food_consumption/recipe_for_food_consumption_model.dart';
import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'food_consumption_model.g.dart';

@JsonSerializable()
class FoodConsumptionModel extends INetworkModel<FoodConsumptionModel> {
  @JsonKey(name: "Id", includeIfNull: false)
  int? id;
  @JsonKey(name: "FoodList")
  List<FoodForFoodConsumptionModel>? foodList;
  @JsonKey(name: "RecipeList")
  List<RecipeForFoodConsumptionModel>? recipeList;
  @JsonKey(name: "CreateDate")
  DateTime? createDate;
  @JsonKey(name: "UserId")
  int? userId;

  FoodConsumptionModel({
    this.id,
    this.foodList,
    this.recipeList,
    this.createDate,
    this.userId,
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
        RecipeList: recipeList!.map((e) => e.toEntity()).toList(),
        CreateDate: createDate,
        UserId: userId,
      );
}
