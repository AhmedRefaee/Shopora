import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/features/auth/set_new_password/presentation/view_model/set_new_password_cubit/set_new_password_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({super.key});

  static const double _fieldSpacing = 10;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetNewPasswordCubit>();
    
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Password field - no state dependency, no rebuilds needed
          _buildPasswordField(context, cubit),
          SizedBox(height: _fieldSpacing.h),
          // Confirm field - only this part listens to state changes
          _ConfirmPasswordSection(),
        ],
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context, SetNewPasswordCubit cubit) {
    return CustomTextfield(
      label: S.of(context).password,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      enableVisibilityToggle: true,
      onChanged: cubit.updatePassword,
    );
  }
}

// Separate widget for confirm field to isolate state listening
class _ConfirmPasswordSection extends StatelessWidget {
  static const double _errorSpacing = 5;
  static const double _errorFontSize = 12;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetNewPasswordCubit>();
    
    return BlocBuilder<SetNewPasswordCubit, SetNewPasswordState>(
      buildWhen: (previous, current) {
        // Only rebuild when confirm password validation changes
        if (previous is SetNewPasswordValidation && 
            current is SetNewPasswordValidation) {
          return previous.confirmPassword != current.confirmPassword ||
                 previous.isPasswordsMatching != current.isPasswordsMatching;
        }
        return current is SetNewPasswordValidation;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              label: S.of(context).confirmPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              enableVisibilityToggle: true,
              validationState: _getValidationState(state),
              onChanged: cubit.updateConfirmPassword,
            ),
            if (_shouldShowError(state)) _buildErrorMessage(context),
          ],
        );
      },
    );
  }

  ValidationState _getValidationState(SetNewPasswordState state) {
    if (state is! SetNewPasswordValidation || state.confirmPassword.isEmpty) {
      return ValidationState.none;
    }
    return state.isPasswordsMatching 
        ? ValidationState.valid 
        : ValidationState.invalid;
  }

  bool _shouldShowError(SetNewPasswordState state) {
    return state is SetNewPasswordValidation && 
           state.confirmPassword.isNotEmpty && 
           !state.isPasswordsMatching;
  }

  Widget _buildErrorMessage(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: _errorSpacing.h),
        Text(
          'Passwords do not match',
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: _errorFontSize.sp,
          ),
        ),
      ],
    );
  }
}
