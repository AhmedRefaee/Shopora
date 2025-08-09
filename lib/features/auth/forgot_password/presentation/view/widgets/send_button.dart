import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/features/auth/forgot_password/presentation/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) {
        if (previous is ForgotPasswordValidation && current is ForgotPasswordValidation) {
          return previous.isFormValid != current.isFormValid;
        }
        return current is ForgotPasswordValidation;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: _isFormValid(state) ? cubit.sendResetEmail : null,
          child: Text(
            S.of(context).send,
            style: AppTextStyles.sixteen,
          ),
        );
      },
    );
  }

  bool _isFormValid(ForgotPasswordState state) {
    return state is ForgotPasswordValidation && state.isFormValid;
  }
}
