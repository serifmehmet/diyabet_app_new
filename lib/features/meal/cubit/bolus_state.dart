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
