import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'set_new_password_state.dart';

class SetNewPasswordCubit extends Cubit<SetNewPasswordState> {
  SetNewPasswordCubit() : super(SetNewPasswordInitial());

  String _password = '';
  String _confirmPassword = '';

  void updatePassword(String password) {
    if (_password == password) return; // Skip if no change
    _password = password;
    _emitValidationState();
  }

  void updateConfirmPassword(String confirmPassword) {
    if (_confirmPassword == confirmPassword) return; // Skip if no change
    _confirmPassword = confirmPassword;
    _emitValidationState();
  }

  void _emitValidationState() {
    final isPasswordsMatching = _arePasswordsMatching();
    final isFormValid = _isFormValid(isPasswordsMatching);

    // Skip emission if state hasn't actually changed
    final currentState = state;
    if (currentState is SetNewPasswordValidation &&
        currentState.password == _password &&
        currentState.confirmPassword == _confirmPassword &&
        currentState.isPasswordsMatching == isPasswordsMatching &&
        currentState.isFormValid == isFormValid) {
      return;
    }

    emit(SetNewPasswordValidation(
      password: _password,
      confirmPassword: _confirmPassword,
      isPasswordsMatching: isPasswordsMatching,
      isFormValid: isFormValid,
    ));
  }

  bool _arePasswordsMatching() {
    return _password.isNotEmpty && 
           _confirmPassword.isNotEmpty && 
           _password == _confirmPassword;
  }

  bool _isFormValid(bool isPasswordsMatching) {
    return _password.isNotEmpty && 
           _confirmPassword.isNotEmpty && 
           isPasswordsMatching;
  }

  void savePassword() {
    final currentState = state;
    if (currentState is SetNewPasswordValidation && currentState.isFormValid) {
      // TODO: Implement password save logic
    }
  }
}
