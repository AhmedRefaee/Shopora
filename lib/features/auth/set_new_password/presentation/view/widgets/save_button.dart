import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/features/auth/set_new_password/presentation/view_model/set_new_password_cubit/set_new_password_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetNewPasswordCubit>();

    return BlocBuilder<SetNewPasswordCubit, SetNewPasswordState>(
      buildWhen: (previous, current) {
        // Only rebuild when form validity changes
        if (previous is SetNewPasswordValidation && 
            current is SetNewPasswordValidation) {
          return previous.isFormValid != current.isFormValid;
        }
        return current is SetNewPasswordValidation;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: _isFormValid(state) ? cubit.savePassword : null,
          child: Text(
            S.of(context).save,
            style: AppTextStyles.sixteen,
          ),
        );
      },
    );
  }

  bool _isFormValid(SetNewPasswordState state) {
    return state is SetNewPasswordValidation && state.isFormValid;
  }
}
