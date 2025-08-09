import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/features/auth/forgot_password/presentation/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class EmailTextfield extends StatefulWidget {
  const EmailTextfield({super.key});

  @override
  State<EmailTextfield> createState() => _EmailTextfieldState();
}

class _EmailTextfieldState extends State<EmailTextfield> {
  late final FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    
    return Form(
      child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
        buildWhen: (previous, current) {
          if (previous is ForgotPasswordValidation && current is ForgotPasswordValidation) {
            return previous.email != current.email ||
                   previous.isEmailValid != current.isEmailValid;
          }
          return current is ForgotPasswordValidation;
        },
        builder: (context, state) {
          return CustomTextfield(
            label: S.of(context).email,
            hint: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            focusNode: _emailFocusNode,
            validationState: _getEmailValidationState(state),
            onChanged: cubit.updateEmail,
            onFieldSubmitted: _handleFormSubmission,
          );
        },
      ),
    );
  }

  ValidationState _getEmailValidationState(ForgotPasswordState state) {
    if (state is! ForgotPasswordValidation || state.email.isEmpty) {
      return ValidationState.none;
    }
    return state.isEmailValid ? ValidationState.valid : ValidationState.invalid;
  }

  void _handleFormSubmission() {
    final cubit = context.read<ForgotPasswordCubit>();
    final state = cubit.state;
    if (state is ForgotPasswordValidation && state.isFormValid) {
      cubit.sendResetEmail();
    }
  }
}
