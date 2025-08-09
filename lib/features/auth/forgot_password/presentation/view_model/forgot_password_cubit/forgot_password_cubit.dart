import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  String _email = '';

  void updateEmail(String email) {
    if (_email == email) return;
    _email = email.trim();
    _emitValidationState();
  }

  void _emitValidationState() {
    final isEmailValid = _isEmailValid();
    final isFormValid = isEmailValid;

    final currentState = state;
    if (currentState is ForgotPasswordValidation &&
        currentState.email == _email &&
        currentState.isEmailValid == isEmailValid &&
        currentState.isFormValid == isFormValid) {
      return;
    }

    emit(ForgotPasswordValidation(
      email: _email,
      isEmailValid: isEmailValid,
      isFormValid: isFormValid,
    ));
  }

  bool _isEmailValid() {
    return _email.isNotEmpty && _email.contains('@') && _email.contains('.');
  }

  Future<void> sendResetEmail() async {
    final currentState = state;
    if (currentState is ForgotPasswordValidation && currentState.isFormValid) {
      emit(ForgotPasswordLoading());
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Emit success to trigger navigation
      emit(ForgotPasswordSuccess());
    }
  }
} 