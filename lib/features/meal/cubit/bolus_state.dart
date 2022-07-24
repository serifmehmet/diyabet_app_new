part of 'bolus_cubit.dart';

abstract class BolusState extends Equatable {
  const BolusState();
}

class BolusInitial extends BolusState {
  @override
  List<Object> get props => [];
}

class BolusTargetTypeChanged extends BolusState {
  final TargetType targetType;
  final double targetValue;

  const BolusTargetTypeChanged({required this.targetType, required this.targetValue});
  @override
  List<Object> get props => [targetType, targetValue];
}

class BolusInfoLoaded extends BolusState {
  final double ikoValue;
  final double idfValue;
  final double targetValue;
  final int lastMealHour;

  const BolusInfoLoaded({required this.idfValue, required this.ikoValue, required this.targetValue, required this.lastMealHour});

  @override
  List<Object?> get props => [ikoValue, idfValue, targetValue, lastMealHour];
}

class BolusCalculated extends BolusState {
  final double resultValue;
  final bool isCalculated;
  final int calculatedMealId;

  const BolusCalculated({required this.resultValue, required this.isCalculated, required this.calculatedMealId});

  @override
  List<Object?> get props => [resultValue, isCalculated, calculatedMealId];
}

class CalculatedBolusSaving extends BolusState {
  @override
  List<Object?> get props => [];
}

class CalculatedBolusSaved extends BolusState {
  final String successMessage;
  final double calculatedBolusValue;

  const CalculatedBolusSaved({required this.successMessage, required this.calculatedBolusValue});

  @override
  List<Object?> get props => [successMessage, calculatedBolusValue];
}

class CalculatedBolusSaveError extends BolusState {
  final String failureMessage;

  const CalculatedBolusSaveError({required this.failureMessage});

  @override
  List<Object?> get props => [failureMessage];
}
