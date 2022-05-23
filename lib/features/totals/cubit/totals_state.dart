part of 'totals_cubit.dart';

abstract class TotalsState extends Equatable {
  const TotalsState();

  @override
  List<Object> get props => [];
}

class TotalsInitial extends TotalsState {}

class AddFood extends TotalsState {}
