import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/remote_food_root.dart';
import '../../../domain/usecases/food/get_food_on_id_usecase.dart';
import '../../../domain/usecases/food/params/get_food_param.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final GetFoodOnIdUseCase getFoodOnIdUseCase;
  FoodCubit({required this.getFoodOnIdUseCase}) : super(FoodInitial());

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
}
