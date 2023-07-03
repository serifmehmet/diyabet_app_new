import 'package:diyabet_app/data/datasources/local/models/consumption_hive_model.dart';
import 'package:hive/hive.dart';
part 'daily_carbs_hive_model.g.dart';

@HiveType(typeId: 1)
class DailyCarbsHiveModel extends HiveObject {
  static const boxKey = "dailyCarbs";

  @HiveField(1)
  late List<ConsumptionHiveModel> foodsAdded;

  @HiveField(2)
  late double totalCarbs;
}
