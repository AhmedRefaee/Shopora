
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/features/auth/email_verification/presentation/view/widgets/email_verification_text_field.dart';
import 'package:shopora/features/auth/email_verification/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';

class EmailVerificationForm extends StatelessWidget {
  const EmailVerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EmailVerificationCubit>();
    
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      buildWhen: (previous, current) {
        if (previous is EmailVerificationValidation && current is EmailVerificationValidation) {
          return previous.verificationCode != current.verificationCode ||
                 previous.isCodeValid != current.isCodeValid;
        }
        return current is EmailVerificationValidation;
      },
      builder: (context, state) {
        final hasError = state is EmailVerificationValidation && 
                        state.verificationCode.isNotEmpty && 
                        !state.isCodeValid;
        
        return EmailVerificationTextField(
          codeLength: 6,
          hasError: hasError,
          onCodeComplete: cubit.updateVerificationCode,
          onCodeChanged: cubit.updateVerificationCode,
        );
      },
    );
  }
}
