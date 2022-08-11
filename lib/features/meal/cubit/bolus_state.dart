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

  const BolusCalculated({required this.resultValue});

  @override
  List<Object?> get props => [resultValue];
}

class CalculatedBolusSaving extends BolusState {
  @override
  List<Object?> get props => [];
}

class CalculatedBolusSaved extends BolusState {
  final String successMessage;
  final double calculatedBolusValue;
  final int calculatedMealId;

  const CalculatedBolusSaved({required this.successMessage, required this.calculatedBolusValue, required this.calculatedMealId});

  @override
  List<Object?> get props => [successMessage, calculatedBolusValue, calculatedMealId];
}

class CalculatedBolusSaveError extends BolusState {
  final String failureMessage;

  const CalculatedBolusSaveError({required this.failureMessage});

  @override
  List<Object?> get props => [failureMessage];
}
