import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/remote_food_unit.dart';
import 'package:equatable/equatable.dart';

part 'food_unit_state.dart';

class FoodUnitCubit extends Cubit<FoodUnitState> {
  FoodUnitCubit() : super(FoodUnitInitial());

  void changeSelectedFoodUnit(String foodUnitName, List<RemoteFoodUnit>? remoteFoodUnits) {
    final changedFoodUnit = remoteFoodUnits!.where((element) => element.UnitName!.toLowerCase() == foodUnitName.toLowerCase()).first;

    emit(SelectedUnitChanged(changedFoodUnit));
  }
}
