import 'package:diyabet_app/data/datasources/local/models/local_receipt_hive_model.dart';

import 'local_food.dart';

class Recipe {
  final int? id;
  final List<LocalFood>? foodList;
  final double? totalCarb;
  final String? recieptName;
  final bool? isApproved;
  final int? portionQuantity;
  final DateTime? createdDate;

  Recipe({
    this.id,
    this.foodList,
    this.totalCarb,
    this.recieptName,
    this.isApproved,
    this.portionQuantity,
    this.createdDate,
  });

  LocalRecieptHiveModel toHiveModel() => LocalRecieptHiveModel()
    ..id = id!
    ..foodList = foodList!.map((e) => e.toHiveModel()).toList()
    ..totalCarb = totalCarb!
    ..isApproved = isApproved!
    ..portionQunatity = portionQuantity!
    ..receiptName = recieptName!
    ..createdDate = createdDate!;
}
