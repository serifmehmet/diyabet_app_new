import '../models/local_recipe_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalRecipeDataSource {
  Future<void> saveLocalReceipt(LocalRecipeHiveModel receiptToSave) async {
    final receiptBox = Hive.box<LocalRecipeHiveModel>(LocalRecipeHiveModel.boxKey);

    await receiptBox.add(receiptToSave);
  }

  Future<void> deleteLocalRecipe(int recipeId) async {
    final recipeBox = Hive.box<LocalRecipeHiveModel>(LocalRecipeHiveModel.boxKey);

    final Map<dynamic, LocalRecipeHiveModel> recipesMap = recipeBox.toMap();
    dynamic keyToDelete;
    recipesMap.forEach(
      (key, value) {
        if (value.id == recipeId) {
          keyToDelete = key;
        }
      },
    );
    await recipeBox.deleteAt(keyToDelete);
  }
}
