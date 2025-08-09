part of 'set_new_password_cubit.dart';

@immutable
sealed class SetNewPasswordState {}

final class SetNewPasswordInitial extends SetNewPasswordState {}

final class SetNewPasswordValidation extends SetNewPasswordState {
  final String password;
  final String confirmPassword;
  final bool isPasswordsMatching;
  final bool isFormValid;

  SetNewPasswordValidation({
    required this.password,
    required this.confirmPassword,
    required this.isPasswordsMatching,
    required this.isFormValid,
  });
}
