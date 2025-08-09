import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String _email = '';
  String _password = '';

  void updateEmail(String email) {
    if (_email == email) return;
    _email = email.trim();
    _emitValidationState();
  }

  void updatePassword(String password) {
    if (_password == password) return;
    _password = password;
    _emitValidationState();
  }

  void _emitValidationState() {
    final isEmailValid = _isEmailValid();
    final isPasswordValid = _isPasswordValid();
    final isFormValid = isEmailValid && isPasswordValid;

    final currentState = state;
    if (currentState is LoginValidation &&
        currentState.email == _email &&
        currentState.password == _password &&
        currentState.isEmailValid == isEmailValid &&
        currentState.isPasswordValid == isPasswordValid &&
        currentState.isFormValid == isFormValid) {
      return;
    }

    emit(LoginValidation(
      email: _email,
      password: _password,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isFormValid: isFormValid,
    ));
  }

  bool _isEmailValid() {
    return _email.isNotEmpty && _email.contains('@') && _email.contains('.');
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 6;
  }

  void login() {
    final currentState = state;
    if (currentState is LoginValidation && currentState.isFormValid) {
      emit(LoginLoading());
      // TODO: Implement login logic
    }
  }
}
