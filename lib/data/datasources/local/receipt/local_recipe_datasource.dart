import '../models/local_recipe_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalRecipeDataSource {
  Future<void> saveLocalReceipt(LocalRecipeHiveModel receiptToSave) async {
    final receiptBox = Hive.box<LocalRecipeHiveModel>(LocalRecipeHiveModel.boxKey);

    await receiptBox.add(receiptToSave);
  }
}
