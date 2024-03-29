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

class NotAuthenticated extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Registered extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginInfoPosting extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginCompleted extends AuthState {
  final User? user;

  const LoginCompleted(this.user);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginFailure extends AuthState {
  final String? failureMessage;

  const LoginFailure(this.failureMessage);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UserRegistering extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserRegisterSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserRegisterFailure extends AuthState {
  final String? errorMessage;

  const UserRegisterFailure({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ResetPasswordLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class ResetPasswordSuccess extends AuthState {
  final String successMessage;

  const ResetPasswordSuccess(this.successMessage);

  @override
  List<Object?> get props => [successMessage];
}

class ResetPasswordError extends AuthState {
  final String errorMessage;

  const ResetPasswordError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
