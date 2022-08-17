import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/food_consumption_repository.dart';
import 'package:diyabet_app/domain/entities/meal_root.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/params/get_meal_by_filter_params.dart';

import '../../../core/base/error/failure.dart';

class GetMealByFilterUseCase extends UseCaseWithFailure<MealRoot, GetMealByFilterParams> {
  final FoodConsumptionRepository foodConsumptionRepository;

  GetMealByFilterUseCase({required this.foodConsumptionRepository});

  @override
  Future<Either<Failure, MealRoot>> call(GetMealByFilterParams params) async {
    final mealRoot = await foodConsumptionRepository.getMealByDate(params.userId!, params.date!);

    return mealRoot;
  }
}
