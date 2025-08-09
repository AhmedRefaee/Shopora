part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginValidation extends LoginState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;

  LoginValidation({
    required this.email,
    required this.password,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isFormValid,
  });
}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}
