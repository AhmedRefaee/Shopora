import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopora/core/config/themes/app_colors.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/elements/back_arrow_button.dart';
import 'package:shopora/core/utils/testing/testing_row.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/features/auth/login/presentation/view/widgets/forgot_password_btn.dart';
import 'package:shopora/features/auth/login/presentation/view/widgets/login_button.dart';
import 'package:shopora/features/auth/login/presentation/view/widgets/login_form.dart';
import 'package:shopora/features/auth/social_account_login/presentation/view/social_account_login.dart';
import 'package:shopora/generated/l10n.dart';
import 'package:shopora/main.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    BackArrowButton(),
                    SizedBox(height: 25.h),

                    ///login title
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),

                      child: Text(
                        S.of(context).login,
                        style: AppTextStyles.headline1,
                      ),
                    ),

                    SizedBox(height: 75.h),

                    ///login form
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: LoginForm(),
                    ),
                    SizedBox(height: 5.h),

                    ///forgot password button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ForgotPasswordBtn(),
                    ),
                    SizedBox(height: 30.h),

                    ///login button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: LoginButton(),
                    ),
                    Spacer(),

                    ///social account login
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
