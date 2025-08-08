import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopora/core/config/themes/app_colors.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/elements/back_arrow_button.dart';
import 'package:shopora/core/utils/testing/testing_row.dart';
import 'package:shopora/core/utils/widgets/email_textfield.dart';
import 'package:shopora/core/utils/widgets/password_textfield.dart';
import 'package:shopora/features/auth/login/presentation/view/widgets/forgot_password_btn.dart';
import 'package:shopora/features/auth/sign_up/presentation/view/widgets/Login_instead.dart';
import 'package:shopora/features/auth/social_account_login/presentation/view/social_account_login.dart';
import 'package:shopora/generated/l10n.dart';
import 'package:shopora/main.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
                    SizedBox(height: 50.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        S.of(context).signUp,
                        style: AppTextStyles.headline1,
                      ),
                    ),

                    SizedBox(height: 75.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Form(
                        child: Column(
                          children: [
                            EmailTextField(),
                            SizedBox(height: 10.h),
                            EmailTextField(),
                            SizedBox(height: 10.h),
                            PasswordTextField(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: LoginInstead(),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).signUp,
                          style: AppTextStyles.fourteen,
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(child: SocialAccountLogin()),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              Positioned(top: 0, left: 0, right: 0, child: TestingRow()),
            ],
          ),
        ),
      ),
    );
  }
}
