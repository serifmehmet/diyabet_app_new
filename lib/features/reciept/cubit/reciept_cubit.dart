import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/entities/food.dart';
import 'package:diyabet_app/domain/usecases/food/get_food_on_name_usecase.dart';
import 'package:diyabet_app/domain/usecases/food/params/get_food_param.dart';
import 'package:equatable/equatable.dart';

part 'reciept_state.dart';

class RecieptCubit extends Cubit<RecieptState> {
  final GetFoodOnNameUseCase? searchFoodUseCase;
  RecieptCubit({this.searchFoodUseCase}) : super(RecieptInitial());

  late Food _food;
  Future<void> searchFoodItemForReciept(String foodName) async {
    emit(RecieptSearch());

    final response = await searchFoodUseCase?.call(GetFoodParam(foodName: foodName));

    if (response != null) {
      if (response.items!.isNotEmpty) {
        _food = response;
        emit(RecieptSearchSuccess(_food));
      } else {
        emit(const RecieptSearchFailure("Besin bulunamadı"));
      }
    } else {
      emit(const RecieptSearchFailure("Besin bulunamadı"));
    }
  }

  clearFoodSeach() {
    emit(RecieptInitial());
  }
}
