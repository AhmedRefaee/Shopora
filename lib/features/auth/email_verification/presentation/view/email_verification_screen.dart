import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/elements/back_arrow_button.dart';
import 'package:shopora/features/auth/email_verification/presentation/view/widgets/verify_button.dart';
import 'package:shopora/features/auth/email_verification/presentation/view/widgets/email_verification_form.dart';
import 'package:shopora/features/auth/email_verification/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
import 'package:shopora/features/auth/set_new_password/presentation/view/set_new_password.dart';
import 'package:shopora/generated/l10n.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  static const double _verticalPadding = 10;
  static const double _backButtonSpacing = 25;
  static const double _formSpacing = 75;
  static const double _buttonSpacing = 70;
  static const double _horizontalPadding = 15;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailVerificationCubit(),
      child: BlocListener<EmailVerificationCubit, EmailVerificationState>(
        listener: (context, state) {
          if (state is EmailVerificationSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SetNewPasswordScreen(),
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
          _buildHeader(),
          SizedBox(height: _formSpacing.h),
          _buildForm(),
          SizedBox(height: _buttonSpacing.h),
          _buildVerifyButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackArrowButton(),
        SizedBox(height: _backButtonSpacing.h),
        _buildTitle(),
        _buildDescription(),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: Text(
        S.of(context).almostThere,
        style: AppTextStyles.headline1,
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.fourteen.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          children: [
            TextSpan(text: S.of(context).almostThereDescription),
            TextSpan(
              text: "arefaee@gmail.com ",
              style: AppTextStyles.sixteen.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextSpan(text: S.of(context).forVerification),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return const Center(
      child: EmailVerificationForm(),
    );
  }

  Widget _buildVerifyButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const VerifyButton(),
    );
  }
}
