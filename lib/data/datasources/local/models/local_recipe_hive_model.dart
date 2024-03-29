import 'package:diyabet_app/data/datasources/local/models/consumption_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'local_recipe_hive_model.g.dart';

@HiveType(typeId: 10)
class LocalRecipeHiveModel extends HiveObject {
  static const boxKey = "recipeModel";

  @HiveField(0)
  late int id;
  @HiveField(1)
  late List<ConsumptionHiveModel> foodList;
  @HiveField(2)
  late double totalCarb;
  @HiveField(3)
  late String receiptName;
  @HiveField(4)
  late bool isApproved;
  @HiveField(5)
  late int portionQunatity;
  @HiveField(6)
  late DateTime createdDate;

  // Recipe toEntity() => Recipe(
  //       id: id,
  //       recipeFoods: foodList.map((e) => e.toEntity()).toList(),
  //       totalCarb: totalCarb,
  //       isApproved: isApproved,
  //       recieptName: receiptName,
  //       portionQuantity: portionQunatity,
  //       createdDate: createdDate,
  //     );
}
