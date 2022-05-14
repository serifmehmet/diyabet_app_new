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

class LoginInfoPosting extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginSuccess extends AuthState {
  final User? user;

  const LoginSuccess(this.user);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginFailure extends AuthState {
  final String? failureMessage;

  const LoginFailure(this.failureMessage);
  @override
  List<Object?> get props => throw UnimplementedError();
}
