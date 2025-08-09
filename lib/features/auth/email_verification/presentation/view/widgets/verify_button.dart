import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/features/auth/email_verification/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EmailVerificationCubit>();

    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      buildWhen: (previous, current) {
        if (previous is EmailVerificationValidation && current is EmailVerificationValidation) {
          return previous.isFormValid != current.isFormValid;
        }
        return current is EmailVerificationValidation;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: _isFormValid(state) ? cubit.verifyCode : null,
          child: Text(
            S.of(context).verify,
            style: AppTextStyles.sixteen,
          ),
        );
      },
    );
  }

  bool _isFormValid(EmailVerificationState state) {
    return state is EmailVerificationValidation && state.isFormValid;
  }
}
