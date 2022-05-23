import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'totals_state.dart';

class TotalsCubit extends Cubit<TotalsState> {
  TotalsCubit() : super(TotalsInitial());
}
