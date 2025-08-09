import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/features/auth/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static const double _fieldSpacing = 10;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    
    return Form(
      child: Column(
        children: [
          _buildEmailField(context, cubit),
          SizedBox(height: _fieldSpacing.h),
          _PasswordFieldSection(
            focusNode: _passwordFocusNode,
            onFieldSubmitted: _handleFormSubmission,
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField(BuildContext context, LoginCubit cubit) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        if (previous is LoginValidation && current is LoginValidation) {
          return previous.email != current.email ||
                 previous.isEmailValid != current.isEmailValid;
        }
        return current is LoginValidation;
      },
      builder: (context, state) {
        return CustomTextfield(
          label: S.of(context).email,
          hint: S.of(context).email,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          focusNode: _emailFocusNode,
          validationState: _getEmailValidationState(state),
          onChanged: cubit.updateEmail,
          onFieldSubmitted: () => _passwordFocusNode.requestFocus(),
        );
      },
    );
  }

  ValidationState _getEmailValidationState(LoginState state) {
    if (state is! LoginValidation || state.email.isEmpty) {
      return ValidationState.none;
    }
    return state.isEmailValid ? ValidationState.valid : ValidationState.invalid;
  }

  void _handleFormSubmission() {
    final cubit = context.read<LoginCubit>();
    final state = cubit.state;
    if (state is LoginValidation && state.isFormValid) {
      cubit.login();
    }
  }
}

class _PasswordFieldSection extends StatelessWidget {
  final FocusNode focusNode;
  final VoidCallback onFieldSubmitted;

  const _PasswordFieldSection({
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        if (previous is LoginValidation && current is LoginValidation) {
          return previous.password != current.password ||
                 previous.isPasswordValid != current.isPasswordValid;
        }
        return current is LoginValidation;
      },
      builder: (context, state) {
        return CustomTextfield(
          label: S.of(context).password,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          focusNode: focusNode,
          obscureText: true,
          enableVisibilityToggle: true,
          validationState: _getPasswordValidationState(state),
          onChanged: cubit.updatePassword,
          onFieldSubmitted: onFieldSubmitted,
        );
      },
    );
  }

  ValidationState _getPasswordValidationState(LoginState state) {
    if (state is! LoginValidation || state.password.isEmpty) {
      return ValidationState.none;
    }
    return state.isPasswordValid ? ValidationState.valid : ValidationState.invalid;
  }
}
