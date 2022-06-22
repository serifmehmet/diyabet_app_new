part of 'iko_cubit.dart';

abstract class IkoState extends Equatable {
  const IkoState();
}

class IkoCubitInitial extends IkoState {
  @override
  List<Object?> get props => [];
}

class EmptyIko extends IkoState {
  @override
  List<Object?> get props => [];
}

class IkoListGetSuccess extends IkoState {
  final List<UserIko> userIkoList;

  const IkoListGetSuccess({required this.userIkoList});

  @override
  List<Object?> get props => [userIkoList];
}

class IKOValueAddedFailure extends IkoState {
  final String failureMessage;

  const IKOValueAddedFailure({required this.failureMessage});

  @override
  List<Object?> get props => [failureMessage];
}
