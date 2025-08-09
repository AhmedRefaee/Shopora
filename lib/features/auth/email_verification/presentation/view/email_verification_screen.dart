import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/elements/back_arrow_button.dart';
import 'package:shopora/core/utils/testing/testing_row.dart';
import 'package:shopora/generated/l10n.dart';
import 'package:shopora/features/auth/email_verification/presentation/view/widgets/verify_button.dart';
import 'package:shopora/features/auth/email_verification/presentation/view/widgets/email_verification_form.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _controller = TextEditingController();
  bool _hasError = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackArrowButton(),
        SizedBox(height: 25.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            S.of(context).almostThere,
            style: AppTextStyles.headline1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 75.h),
                    Center(
                      child: EmailVerificationForm(
                        controllers: [_controller],
                        hasError: _hasError,
                      ),
                    ),
                    SizedBox(height: 70.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: const VerifyButton(),
                    ),
                  ],
                ),
              ),
              const Positioned(top: 0, left: 0, right: 0, child: TestingRow()),
            ],
          ),
        ),
      ),
    );
  }
}
