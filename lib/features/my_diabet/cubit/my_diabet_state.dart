part of 'my_diabet_cubit.dart';

abstract class MyDiabetState extends Equatable {
  const MyDiabetState();
}

class MyDiabetInitial extends MyDiabetState {
  @override
  List<Object> get props => [];
}

class MyDiabetIdfListGetSuccess extends MyDiabetState {
  final List<UserIdf> userIdfList;

  const MyDiabetIdfListGetSuccess({required this.userIdfList});

  @override
  List<Object?> get props => [userIdfList];
}

class MyDiabetEmptyIdf extends MyDiabetState {
  @override
  List<Object?> get props => [];
}

class MyDiabetValueAddedFailure extends MyDiabetState {
  final String failureMessage;

  const MyDiabetValueAddedFailure({required this.failureMessage});
  @override
  List<Object> get props => [];
}
