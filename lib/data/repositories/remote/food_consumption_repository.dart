import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/base/error/app_exception.dart';
import 'package:diyabet_app/data/datasources/remote/food_consumption/food_consumption_remote_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/models/food_consumption/food_consumption_model.dart';
import 'package:diyabet_app/domain/entities/meal_root.dart';

import '../../../core/base/error/failure.dart';

abstract class FoodConsumptionRepository {
  Future<void> addFoodConsumption(FoodConsumptionModel foodConsumptionModel);
  Future<Either<Failure, MealRoot>> getMealByDate(int userId, DateTime dateToFilter);
}

class FoodConsumptionRepositoryImpl extends FoodConsumptionRepository {
  final FoodConsumptionRemoteDataSource consumptionRemoteDataSource;

  FoodConsumptionRepositoryImpl({required this.consumptionRemoteDataSource});
  @override
  Future<void> addFoodConsumption(FoodConsumptionModel foodConsumptionModel) async {
    final foodConsumptionModelResponse = await consumptionRemoteDataSource.addConsumption(foodConsumptionModel);
  }

  @override
  Future<Either<Failure, MealRoot>> getMealByDate(int userId, DateTime dateToFilter) async {
    try {
      final mealRootModelResponse = await consumptionRemoteDataSource.getFoodConsumptionByDate(userId, dateToFilter);

      final mealRoot = mealRootModelResponse!.toEntity();
      return Right(mealRoot);
    } on UnAuthorized {
      return const Left(
        UnAuthorizedError(),
      );
    } on EmptyResponseError {
      return const Left(EmptyResponseError());
    }
  }
}
