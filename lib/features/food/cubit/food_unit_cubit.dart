import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/remote_food_unit.dart';
import 'package:equatable/equatable.dart';

part 'food_unit_state.dart';

class FoodUnitCubit extends Cubit<FoodUnitState> {
  FoodUnitCubit() : super(FoodUnitInitial(const RemoteFoodUnit()));

  late RemoteFoodUnit selectedUnit;
  void changeSelectedFoodUnit(String foodUnitName, List<RemoteFoodUnit>? remoteFoodUnits, String quantity) {
    final changedFoodUnit = remoteFoodUnits!.where((element) => element.UnitName!.toLowerCase() == foodUnitName.toLowerCase()).first;
    selectedUnit = changedFoodUnit;
    double carbValue = (changedFoodUnit.CarbValue! * double.parse(quantity));

    emit(SelectedUnitChanged(carbValue));
  }

  void changeCarbValue(String quantity) {
    double carbValue = selectedUnit.CarbValue! * double.parse(quantity);

    emit(SelectedQuantityChanged(carbValue));
  }

  void clearUnits() {
    emit(FoodUnitInitial(const RemoteFoodUnit()));
  }
}
