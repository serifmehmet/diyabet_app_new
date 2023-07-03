import 'package:diyabet_app/data/datasources/local/models/consumption_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FoodLocalDataSource {
  Future<void> saveSelectedFood(ConsumptionHiveModel foodToSave) async {
    final foodBox = Hive.box<ConsumptionHiveModel>(ConsumptionHiveModel.boxKey);

    await foodBox.add(foodToSave);
  }

  Future<List<ConsumptionHiveModel?>> getItems() async {
    final foodBox = Hive.box<ConsumptionHiveModel>(ConsumptionHiveModel.boxKey);

    final foods = foodBox.values.toList();

    return foods;
  }

  Future<ConsumptionHiveModel?> getSingleFood(int foodIndex) async {
    final foodBox = Hive.box<ConsumptionHiveModel>(ConsumptionHiveModel.boxKey);

    final singleFood = foodBox.values.singleWhere((e) => e.index == foodIndex);

    return singleFood;
  }

  Future<void> updateSingleFood(ConsumptionHiveModel foodToUpdate) async {
    final foodBox = Hive.box<ConsumptionHiveModel>(ConsumptionHiveModel.boxKey);
    final key = foodBox.values.singleWhere((e) => e.index == foodToUpdate.index).key;
    await foodBox.putAt(key, foodToUpdate);
  }

  Future<void> deleteAllFoods() async {
    final foodBox = Hive.box<ConsumptionHiveModel>(ConsumptionHiveModel.boxKey);

    await foodBox.clear();
  }

  Future<void> deleteSingleFood(int foodId) async {
    final foodBox = Hive.box<ConsumptionHiveModel>(ConsumptionHiveModel.boxKey);

    final Map<dynamic, ConsumptionHiveModel> foodsMap = foodBox.toMap();
    dynamic keyToDelete;
    foodsMap.forEach(
      (key, value) {
        if (value.index == foodId) {
          keyToDelete = key;
        }
      },
    );
    await foodBox.delete(keyToDelete);
  }
}
