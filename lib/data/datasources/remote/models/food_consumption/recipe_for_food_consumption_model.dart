import 'package:diyabet_app/domain/entities/recipe_for_food_consumption.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'recipe_for_food_consumption_model.g.dart';

@JsonSerializable()
class RecipeForFoodConsumptionModel extends INetworkModel<RecipeForFoodConsumptionModel> {
  int? recipeId;
  int? quantity;

  RecipeForFoodConsumptionModel({
    this.recipeId,
    this.quantity,
  });

  @override
  factory RecipeForFoodConsumptionModel.fromJson(Map<String, dynamic> json) {
    return _$RecipeForFoodConsumptionModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RecipeForFoodConsumptionModelToJson(this);
  }

  @override
  RecipeForFoodConsumptionModel fromJson(Map<String, dynamic> json) {
    return RecipeForFoodConsumptionModel.fromJson(json);
  }

  RecipeForFoodConsumption toEntity() => RecipeForFoodConsumption(
        recipeId: recipeId,
        quantity: quantity,
      );
}
