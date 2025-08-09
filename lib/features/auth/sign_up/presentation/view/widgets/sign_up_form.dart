
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/features/auth/sign_up/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  static const double _fieldSpacing = 10;

  late final FocusNode _nameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    
    return Form(
      child: Column(
        children: [
          _buildNameField(context, cubit),
          SizedBox(height: _fieldSpacing.h),
          _EmailFieldSection(
            focusNode: _emailFocusNode,
            onFieldSubmitted: () => _passwordFocusNode.requestFocus(),
          ),
          SizedBox(height: _fieldSpacing.h),
          _PasswordFieldSection(
            focusNode: _passwordFocusNode,
            onFieldSubmitted: _handleFormSubmission,
          ),
        ],
      ),
    );
  }

  Widget _buildNameField(BuildContext context, SignUpCubit cubit) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) {
        if (previous is SignUpValidation && current is SignUpValidation) {
          return previous.name != current.name ||
                 previous.isNameValid != current.isNameValid;
        }
        return current is SignUpValidation;
      },
      builder: (context, state) {
        return CustomTextfield(
          label: S.of(context).name,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          focusNode: _nameFocusNode,
          validationState: _getNameValidationState(state),
          onChanged: cubit.updateName,
          onFieldSubmitted: () => _emailFocusNode.requestFocus(),
        );
      },
    );
  }

  ValidationState _getNameValidationState(SignUpState state) {
    if (state is! SignUpValidation || state.name.isEmpty) {
      return ValidationState.none;
    }
    return state.isNameValid ? ValidationState.valid : ValidationState.invalid;
  }

  void _handleFormSubmission() {
    final cubit = context.read<SignUpCubit>();
    final state = cubit.state;
    if (state is SignUpValidation && state.isFormValid) {
      cubit.signUp();
    }
  }
}

class _EmailFieldSection extends StatelessWidget {
  final FocusNode focusNode;
  final VoidCallback onFieldSubmitted;

  const _EmailFieldSection({
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) {
        if (previous is SignUpValidation && current is SignUpValidation) {
          return previous.email != current.email ||
                 previous.isEmailValid != current.isEmailValid;
        }
        return current is SignUpValidation;
      },
      builder: (context, state) {
        return CustomTextfield(
          label: S.of(context).email,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          focusNode: focusNode,
          validationState: _getEmailValidationState(state),
          onChanged: cubit.updateEmail,
          onFieldSubmitted: onFieldSubmitted,
        );
      },
    );
  }

  ValidationState _getEmailValidationState(SignUpState state) {
    if (state is! SignUpValidation || state.email.isEmpty) {
      return ValidationState.none;
    }
    return state.isEmailValid ? ValidationState.valid : ValidationState.invalid;
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
    final cubit = context.read<SignUpCubit>();
    
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) {
        if (previous is SignUpValidation && current is SignUpValidation) {
          return previous.password != current.password ||
                 previous.isPasswordValid != current.isPasswordValid;
        }
        return current is SignUpValidation;
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

  ValidationState _getPasswordValidationState(SignUpState state) {
    if (state is! SignUpValidation || state.password.isEmpty) {
      return ValidationState.none;
    }
    return state.isPasswordValid ? ValidationState.valid : ValidationState.invalid;
  }
}
