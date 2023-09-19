import 'package:diyabet_app/data/datasources/local/models/local_recipe_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/receipt/local_recipe_datasource.dart';

abstract class LocalRecipeRepository {
  Future<void> saveLocalReceipt(LocalRecipeHiveModel receiptToSave);
  Future<void> deleteLocalRecipe(int recipeId);
}

class LocalRecipeRepositoryImpl extends LocalRecipeRepository {
  final LocalRecipeDataSource localRecipeDataSource;

  LocalRecipeRepositoryImpl({required this.localRecipeDataSource});

  @override
  Future<void> saveLocalReceipt(LocalRecipeHiveModel receiptToSave) async {
    await localRecipeDataSource.saveLocalReceipt(receiptToSave);
  }

  @override
  Future<void> deleteLocalRecipe(int recipeId) async {
    await localRecipeDataSource.deleteLocalRecipe(recipeId);
  }
}
