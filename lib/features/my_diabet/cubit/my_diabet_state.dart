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

class MyDiabetIdfAddedSuccess extends MyDiabetState {
  final UserIdf userIdf;

  const MyDiabetIdfAddedSuccess({required this.userIdf});
  @override
  List<Object> get props => [userIdf];
}

class MyDiabetValueAddedFailure extends MyDiabetState {
  final String failureMessage;

  const MyDiabetValueAddedFailure({required this.failureMessage});
  @override
  List<Object> get props => [];
}
