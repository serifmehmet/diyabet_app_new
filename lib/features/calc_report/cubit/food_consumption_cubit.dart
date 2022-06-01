import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/food_consumption.dart';
import 'package:diyabet_app/domain/entities/food_for_food_consumption.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/params/save_food_consumption_params.dart';
import 'package:diyabet_app/domain/usecases/food_consumption/save_food_consumption_usecase.dart';
import 'package:equatable/equatable.dart';

part 'food_consumption_state.dart';

class FoodConsumptionCubit extends Cubit<FoodConsumptionState> {
  final SaveFoodConsumptionUseCase foodConsumptionUseCase;
  FoodConsumptionCubit({required this.foodConsumptionUseCase}) : super(FoodConsumptionInitial());

  Future<void> saveConsumption(List<LocalFood?> localFoods) async {
    List<FoodForFoodConsumption> foodList = [];

    for (var e in localFoods) {
      FoodForFoodConsumption foodForFoodConsumption = FoodForFoodConsumption(
        FoodId: e!.Id,
        UnitTypeId: e.UnitId,
        CarbTotal: e.CarbTotal,
        Quantity: e.Quantity,
      );

      foodList.add(foodForFoodConsumption);
    }

    FoodConsumption consumption = FoodConsumption(
      FoodList: foodList,
      CreateDate: DateTime.now(),
    );

    await foodConsumptionUseCase.call(SaveFoodConsumptionParams(consumption));
  }
}
