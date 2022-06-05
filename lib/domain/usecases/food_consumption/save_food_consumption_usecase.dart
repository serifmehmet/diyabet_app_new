import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/food_consumption_repository.dart';
import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/params/save_food_consumption_params.dart';

class SaveFoodConsumptionUseCase extends UseCase<void, SaveFoodConsumptionParams> {
  final FoodConsumptionRepository foodConsumptionRepository;

  SaveFoodConsumptionUseCase({required this.foodConsumptionRepository});

  @override
  Future<void> call(SaveFoodConsumptionParams params) async {
    final response = await foodConsumptionRepository.addFoodConsumption(params.foodConsumption!.toModel());
  }
}
