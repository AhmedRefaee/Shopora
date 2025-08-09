import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/features/auth/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        if (previous is LoginValidation && current is LoginValidation) {
          return previous.isFormValid != current.isFormValid;
        }
        return current is LoginValidation;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: _isFormValid(state) ? cubit.login : null,
          child: Text(
            S.of(context).login,
            style: AppTextStyles.sixteen,
          ),
        );
      },
    );
  }

  bool _isFormValid(LoginState state) {
    return state is LoginValidation && state.isFormValid;
  }
}
