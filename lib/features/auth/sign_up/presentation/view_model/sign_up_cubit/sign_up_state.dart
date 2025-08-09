part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpValidation extends SignUpState {
  final String name;
  final String email;
  final String password;
  final bool isNameValid;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;

  SignUpValidation({
    required this.name,
    required this.email,
    required this.password,
    required this.isNameValid,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isFormValid,
  });
}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpError extends SignUpState {
  final String message;

  SignUpError({required this.message});
} 