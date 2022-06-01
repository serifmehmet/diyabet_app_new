import 'package:diyabet_app/data/datasources/remote/food_consumption/food_consumption_remote_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_consumption_model.dart';
import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:diyabet_app/domain/entities/food_for_food_consumption.dart';

abstract class FoodConsumptionRepository {
  Future<FoodConsumption?> addFoodConsumption(FoodConsumptionModel foodConsumptionModel);
}

class FoodConsumptionRepositoryImpl extends FoodConsumptionRepository {
  final FoodConsumptionRemoteDataSource consumptionRemoteDataSource;

  FoodConsumptionRepositoryImpl({required this.consumptionRemoteDataSource});
  @override
  Future<FoodConsumption?> addFoodConsumption(FoodConsumptionModel foodConsumptionModel) async {
    final foodConsumptionModelResponse = await consumptionRemoteDataSource.addConsumption(foodConsumptionModel);
    final foodConsumption = foodConsumptionModelResponse!.toEntity();

    return foodConsumption;
  }
}
