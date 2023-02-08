part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final LoginResponse loginResponse;
  final UserFirebase userFirebase;
  const AuthLoaded(this.loginResponse, this.userFirebase);

  @override
  List<Object> get props => [loginResponse, userFirebase];
}

class AuthFailed extends AuthState {
  final String message;
  const AuthFailed(this.message);

  @override
  List<Object> get props => [message];
}

class RegisInitial extends AuthState {}

class RegistLoading extends AuthState {}

class RegisLoaded extends AuthState {
  final RegisterResponse registerResponse;
  const RegisLoaded(this.registerResponse);

  @override
  List<Object> get props => [registerResponse];
}

class RegisFailed extends AuthState {
  final String message;
  const RegisFailed(this.message);

  @override
  List<Object> get props => [message];
}

class ResetPasswordLoaded extends AuthState {
  final ResetPasswordResponse resetPasswordResponse;
  const ResetPasswordLoaded(this.resetPasswordResponse);
}

class ResetPasswordFailed extends AuthState {
  final String message;
  const ResetPasswordFailed(this.message);
}

class SignoutSuccess extends AuthState {
  final bool isSuccess;
  const SignoutSuccess(this.isSuccess);

  @override
  List<Object> get props => [isSuccess];
}
