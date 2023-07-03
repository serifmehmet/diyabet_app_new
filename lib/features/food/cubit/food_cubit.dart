import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/local_consumption_item.dart';
import 'package:diyabet_app/domain/entities/remote_food_unit.dart';
import 'package:diyabet_app/domain/usecases/food/get_single_food_from_local_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/remote_food_root.dart';
import '../../../domain/usecases/food/get_food_on_id_usecase.dart';
import '../../../domain/usecases/food/params/get_food_param.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final GetFoodOnIdUseCase getFoodOnIdUseCase;
  final GetSingleFoodFromLocalUseCase getSingleFoodFromLocal;
  FoodCubit({required this.getFoodOnIdUseCase, required this.getSingleFoodFromLocal}) : super(FoodInitial());

  late RemoteFoodRoot? _remoteFood;
  Future<void> getFoodOnId(int foodId) async {
    emit(SingleFoodLoading());
    final response = await getFoodOnIdUseCase.call(GetFoodParam(foodId: foodId));

    if (response != null) {
      _remoteFood = response;

      emit(SingleFoodLoadSuccess(_remoteFood));
    } else {
      emit(const SingleFoodLoadFailure("Besin detayı gelirken bir hata oluştu"));
    }
  }

  LocalConsumptionItem? localFood;
  RemoteFoodUnit? selectedUnit;
  Future<void> getSingleFoodOnIndex(int foodIndex, int foodId) async {
    emit(SingleFoodLoading());
    final responseRemote = await getFoodOnIdUseCase.call(GetFoodParam(foodId: foodId));
    final responseLocal = await getSingleFoodFromLocal.call(GetFoodParam(foodIndex: foodIndex));

    if (responseRemote != null && responseLocal != null) {
      localFood = responseLocal;
      _remoteFood = responseRemote;

      selectedUnit = _remoteFood!.FoodUnits!.singleWhere(
        (element) => element.UnitName!.toLowerCase() == localFood!.UnitType!.toLowerCase(),
      );

      emit(EditFoodLoadSuccess(localFood, _remoteFood, selectedUnit));
    } else {
      emit(const SingleFoodLoadFailure("Besin getirilirken bir hata oluştu."));
    }
  }
}
