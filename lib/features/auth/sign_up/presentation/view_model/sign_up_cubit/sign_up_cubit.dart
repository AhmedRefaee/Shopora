import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  String _name = '';
  String _email = '';
  String _password = '';

  void updateName(String name) {
    if (_name == name) return;
    _name = name.trim();
    _emitValidationState();
  }

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
    final isNameValid = _isNameValid();
    final isEmailValid = _isEmailValid();
    final isPasswordValid = _isPasswordValid();
    final isFormValid = isNameValid && isEmailValid && isPasswordValid;

    final currentState = state;
    if (currentState is SignUpValidation &&
        currentState.name == _name &&
        currentState.email == _email &&
        currentState.password == _password &&
        currentState.isNameValid == isNameValid &&
        currentState.isEmailValid == isEmailValid &&
        currentState.isPasswordValid == isPasswordValid &&
        currentState.isFormValid == isFormValid) {
      return;
    }

    emit(SignUpValidation(
      name: _name,
      email: _email,
      password: _password,
      isNameValid: isNameValid,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isFormValid: isFormValid,
    ));
  }

  bool _isNameValid() {
    return _name.isNotEmpty && _name.length >= 2;
  }

  bool _isEmailValid() {
    return _email.isNotEmpty && _email.contains('@') && _email.contains('.');
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 6;
  }

  void signUp() {
    final currentState = state;
    if (currentState is SignUpValidation && currentState.isFormValid) {
      emit(SignUpLoading());
      // TODO: Implement sign up logic
    }
  }
} 