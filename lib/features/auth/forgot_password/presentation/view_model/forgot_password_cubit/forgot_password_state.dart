part of 'forgot_password_cubit.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordValidation extends ForgotPasswordState {
  final String email;
  final bool isEmailValid;
  final bool isFormValid;

  ForgotPasswordValidation({
    required this.email,
    required this.isEmailValid,
    required this.isFormValid,
  });
}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {}

final class ForgotPasswordError extends ForgotPasswordState {
  final String message;

  ForgotPasswordError({required this.message});
} 