import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/features/auth/sign_up/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) {
        if (previous is SignUpValidation && current is SignUpValidation) {
          return previous.isFormValid != current.isFormValid;
        }
        return current is SignUpValidation;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: _isFormValid(state) ? cubit.signUp : null,
          child: Text(
            S.of(context).signUp,
            style: AppTextStyles.sixteen,
          ),
        );
      },
    );
  }

  bool _isFormValid(SignUpState state) {
    return state is SignUpValidation && state.isFormValid;
  }
}
