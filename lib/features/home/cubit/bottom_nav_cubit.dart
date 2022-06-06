import 'package:bloc/bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updateSelectedIndex(int index) => emit(index);

  void getHome() => emit(0);
  void getSearch() => emit(1);
  void getTotals() => emit(2);
  void getConsumption() => emit(3);
  void getBolusScreen() => emit(4);
}
