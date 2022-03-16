part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
