import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/elements/back_arrow_button.dart';
import 'package:shopora/features/auth/email_verification/presentation/view/email_verification_screen.dart';
import 'package:shopora/features/auth/forgot_password/presentation/view/widgets/email_textfield.dart';
import 'package:shopora/features/auth/forgot_password/presentation/view/widgets/send_button.dart';
import 'package:shopora/features/auth/forgot_password/presentation/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  static const double _verticalPadding = 10;
  static const double _backButtonSpacing = 25;
  static const double _titleSpacing = 75;
  static const double _buttonSpacing = 70;
  static const double _horizontalPadding = 15;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EmailVerificationScreen(),
              ),
            );
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: _buildMainContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _verticalPadding.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackArrowButton(),
          SizedBox(height: _backButtonSpacing.h),
          _buildTitle(),
          SizedBox(height: _titleSpacing.h),
          _buildEmailField(),
          SizedBox(height: _buttonSpacing.h),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: Text(
        S.of(context).forgotPassword,
        style: AppTextStyles.headline1,
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const EmailTextfield(),
    );
  }

  Widget _buildSendButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const SendButton(),
    );
  }
}
