import 'package:diyabet_app/data/datasources/local/models/daily_carbs_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/food_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/user_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<FoodHiveModel>(FoodHiveModelAdapter());
    Hive.registerAdapter<DailyCarbsHiveModel>(DailyCarbsHiveModelAdapter());
    Hive.registerAdapter<UserHiveModel>(UserHiveModelAdapter());

    await Hive.openBox<UserHiveModel>(UserHiveModel.boxKey);
    await Hive.openBox<FoodHiveModel>(FoodHiveModel.boxKey);
    await Hive.openBox<DailyCarbsHiveModel>(DailyCarbsHiveModel.boxKey);
  }
}
