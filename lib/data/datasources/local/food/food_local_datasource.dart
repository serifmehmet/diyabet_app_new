import 'dart:ui';

import 'package:diyabet_app/data/datasources/local/models/food_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FoodLocalDataSource {
  Future<void> saveSelectedFood(FoodHiveModel foodToSave) async {
    final foodBox = Hive.box<FoodHiveModel>(FoodHiveModel.boxKey);

    await foodBox.add(foodToSave);
  }

  Future<List<FoodHiveModel?>> getFoods() async {
    final foodBox = Hive.box<FoodHiveModel>(FoodHiveModel.boxKey);

    final foods = foodBox.values.toList();

    return foods;
  }

  Future<FoodHiveModel?> getSingleFood(int foodIndex) async {
    final foodBox = Hive.box<FoodHiveModel>(FoodHiveModel.boxKey);

    final singleFood = foodBox.values.singleWhere((e) => e.index == foodIndex);

    return singleFood;
  }

  Future<void> updateSingleFood(FoodHiveModel foodToUpdate) async {
    final foodBox = Hive.box<FoodHiveModel>(FoodHiveModel.boxKey);
    final key = foodBox.values.singleWhere((e) => e.index == foodToUpdate.index).key;
    await foodBox.putAt(key, foodToUpdate);
  }

  Future<void> deleteAllFoods() async {
    final foodBox = Hive.box<FoodHiveModel>(FoodHiveModel.boxKey);

    await foodBox.clear();
  }

  Future<void> deleteSingleFood(int foodId) async {
    final foodBox = Hive.box<FoodHiveModel>(FoodHiveModel.boxKey);

    final Map<dynamic, FoodHiveModel> foodsMap = foodBox.toMap();
    dynamic keyToDelete;
    foodsMap.forEach(
      (key, value) {
        if (value.id == foodId) {
          keyToDelete = key;
        }
      },
    );
    await foodBox.delete(keyToDelete);
  }
}
