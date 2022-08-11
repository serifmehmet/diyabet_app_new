import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/remote_food_unit.dart';
import 'package:diyabet_app/features/food/cubit/food_cubit.dart';
import 'package:equatable/equatable.dart';

part 'food_unit_state.dart';

class FoodUnitCubit extends Cubit<FoodUnitState> {
  final FoodCubit foodCubit;
  FoodUnitCubit({required this.foodCubit}) : super(FoodUnitInitial(const RemoteFoodUnit()));

  RemoteFoodUnit? selectedUnit;
  double? carbValue;
  void changeSelectedFoodUnit(String foodUnitName, List<RemoteFoodUnit>? remoteFoodUnits, String quantity) {
    final changedFoodUnit = remoteFoodUnits!.where((element) => element.UnitName!.toLowerCase() == foodUnitName.toLowerCase()).first;
    selectedUnit = changedFoodUnit;
    carbValue = (changedFoodUnit.CarbValue! * double.parse(quantity));

    emit(SelectedUnitChanged(carbValue));
  }

  void changeCarbValue(String quantity, RemoteFoodUnit? selectedFoodUnit) {
    if (selectedUnit != null) {
      carbValue = selectedUnit!.CarbValue! * double.parse(quantity);
    } else {
      selectedUnit = selectedFoodUnit;
      carbValue = selectedFoodUnit!.CarbValue! * double.parse(quantity);
    }

    emit(SelectedQuantityChanged(carbValue));
  }

  void clearUnits() {
    carbValue = double.nan;
    selectedUnit = null;
    emit(FoodUnitInitial(const RemoteFoodUnit()));
  }
}
