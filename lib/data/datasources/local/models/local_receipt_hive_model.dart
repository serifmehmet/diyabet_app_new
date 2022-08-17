import 'package:diyabet_app/data/datasources/local/models/food_hive_model.dart';
import 'package:diyabet_app/domain/entities/recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'local_receipt_hive_model.g.dart';

@HiveType(typeId: 10)
class LocalRecieptHiveModel extends HiveObject {
  static const boxKey = "receiptModel";

  @HiveField(0)
  late int id;
  @HiveField(1)
  late List<FoodHiveModel> foodList;
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

  Recipe toEntity() => Recipe(
        id: id,
        foodList: foodList.map((e) => e.toEntity()).toList(),
        isApproved: isApproved,
        recieptName: receiptName,
        portionQuantity: portionQunatity,
        createdDate: createdDate,
      );
}
