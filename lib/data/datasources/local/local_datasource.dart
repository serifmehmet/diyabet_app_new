import 'package:diyabet_app/data/datasources/local/models/daily_carbs_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/food_cache_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/consumption_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/food_to_cache_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/local_recipe_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/user_blood_target_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/user_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/user_idf_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/models/user_iko_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<ConsumptionHiveModel>(ConsumptionHiveModelAdapter());
    Hive.registerAdapter<FoodToCacheHiveModel>(FoodToCacheHiveModelAdapter());
    Hive.registerAdapter<FoodCacheHiveModel>(FoodCacheHiveModelAdapter());

    Hive.registerAdapter<DailyCarbsHiveModel>(DailyCarbsHiveModelAdapter());
    Hive.registerAdapter<UserHiveModel>(UserHiveModelAdapter());
    Hive.registerAdapter<UserIdfHiveModel>(UserIdfHiveModelAdapter());
    Hive.registerAdapter<UserIkoHiveModel>(UserIkoHiveModelAdapter());
    Hive.registerAdapter<UserBloodTargetHiveModel>(UserBloodTargetHiveModelAdapter());

    Hive.registerAdapter<LocalRecipeHiveModel>(LocalRecipeHiveModelAdapter());

    await Hive.openBox<UserHiveModel>(UserHiveModel.boxKey);
    await Hive.openBox<ConsumptionHiveModel>(ConsumptionHiveModel.boxKey);
    await Hive.openBox<FoodCacheHiveModel>(FoodCacheHiveModel.boxKey);
    await Hive.openBox<FoodToCacheHiveModel>(FoodToCacheHiveModel.boxKey);
    await Hive.openBox<DailyCarbsHiveModel>(DailyCarbsHiveModel.boxKey);
    await Hive.openBox<UserIdfHiveModel>(UserIdfHiveModel.boxKey);
    await Hive.openBox<UserIkoHiveModel>(UserIkoHiveModel.boxKey);
    await Hive.openBox<UserBloodTargetHiveModel>(UserBloodTargetHiveModel.boxKey);

    await Hive.openBox<LocalRecipeHiveModel>(LocalRecipeHiveModel.boxKey);
  }
}
