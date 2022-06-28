part of 'user_blood_target_cubit.dart';

abstract class UserBloodTargetState extends Equatable {
  const UserBloodTargetState();
}

class UserBloodTargetInitial extends UserBloodTargetState {
  @override
  List<Object> get props => [];
}

class UserBloodTargetSaving extends UserBloodTargetState {
  @override
  List<Object?> get props => [];
}

class UserBloodTargetSaved extends UserBloodTargetState {
  @override
  List<Object?> get props => [];
}

class UserBloodTargetSaveFailure extends UserBloodTargetState {
  final String errorMessage;

  const UserBloodTargetSaveFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class UserBloodTargetLoaded extends UserBloodTargetState {
  final UserBloodTarget userBloodTarget;

  const UserBloodTargetLoaded({required this.userBloodTarget});

  @override
  List<Object?> get props => [userBloodTarget];
}

class UserBloodTargetLoadFailure extends UserBloodTargetState {
  final String errorMessage;

  const UserBloodTargetLoadFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
