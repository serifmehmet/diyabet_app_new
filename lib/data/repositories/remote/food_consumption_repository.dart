import 'package:diyabet_app/data/datasources/remote/food_consumption/food_consumption_remote_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_consumption_model.dart';
import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:diyabet_app/domain/entities/food_for_food_consumption.dart';
import 'package:diyabet_app/domain/entities/meal_root.dart';

abstract class FoodConsumptionRepository {
  Future<void> addFoodConsumption(FoodConsumptionModel foodConsumptionModel);
  Future<MealRoot?> getMealByDate(int userId, DateTime dateToFilter);
}

class FoodConsumptionRepositoryImpl extends FoodConsumptionRepository {
  final FoodConsumptionRemoteDataSource consumptionRemoteDataSource;

  FoodConsumptionRepositoryImpl({required this.consumptionRemoteDataSource});
  @override
  Future<void> addFoodConsumption(FoodConsumptionModel foodConsumptionModel) async {
    final foodConsumptionModelResponse = await consumptionRemoteDataSource.addConsumption(foodConsumptionModel);
  }

  @override
  Future<MealRoot?> getMealByDate(int userId, DateTime dateToFilter) async {
    final mealRootModelResponse = await consumptionRemoteDataSource.getFoodConsumptionByDate(userId, dateToFilter);

    if (mealRootModelResponse == null) return null;

    final mealRoot = mealRootModelResponse.toEntity();

    return mealRoot;
  }
}
