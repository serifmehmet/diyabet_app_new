import 'package:diyabet_app/data/datasources/remote/models/recipe/remote_recipe_model.dart';
import 'package:diyabet_app/domain/entities/recipe_food.dart';

class Recipe {
  final int? id;
  final List<RecipeFood>? recipeFoods;
  final double? totalCarb;
  final String? name;
  final bool? isApproved;
  final int? portionQuantity;
  final int? userId;
  final DateTime? createdDate;
  final DateTime? updatedDate;

  Recipe({
    this.id,
    this.recipeFoods,
    this.totalCarb,
    this.name,
    this.isApproved,
    this.portionQuantity,
    this.userId,
    this.createdDate,
    this.updatedDate,
  });

  RemoteRecipeModel toModel() => RemoteRecipeModel(
        id: id,
        createdAt: createdDate,
        isApproved: isApproved,
        name: name,
        portionQuantity: portionQuantity,
        recipeFoods: recipeFoods!.map((e) => e.toModel()).toList(),
        totalCarb: totalCarb,
        updatedAt: updatedDate,
        userId: userId,
      );
  // LocalRecieptHiveModel toHiveModel() => LocalRecieptHiveModel()
  //   ..id = id!
  //   ..foodList = recipeFoods!.map((e) => e.toHiveModel()).toList()
  //   ..totalCarb = totalCarb!
  //   ..isApproved = isApproved!
  //   ..portionQunatity = portionQuantity!
  //   ..receiptName = recieptName!
  //   ..createdDate = createdDate!;
}
