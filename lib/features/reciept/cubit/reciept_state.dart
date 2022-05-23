part of 'reciept_cubit.dart';

abstract class RecieptState extends Equatable {
  const RecieptState();
}

class RecieptInitial extends RecieptState {
  @override
  List<Object> get props => [];
}

class RecieptSearch extends RecieptState {
  @override
  List<Object> get props => [];
}

class RecieptSearchSuccess extends RecieptState {
  final Food? food;

  const RecieptSearchSuccess(this.food);

  @override
  List<Object> get props => [food!];
}

class RecieptSearchFailure extends RecieptState {
  final String message;

  const RecieptSearchFailure(this.message);

  @override
  List<Object> get props => [message];
}
