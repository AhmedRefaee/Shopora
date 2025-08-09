import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/elements/back_arrow_button.dart';
import 'package:shopora/features/auth/login/presentation/view/widgets/forgot_password_btn.dart';
import 'package:shopora/features/auth/login/presentation/view/widgets/login_button.dart';
import 'package:shopora/features/auth/login/presentation/view/widgets/login_form.dart';
import 'package:shopora/features/auth/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:shopora/features/auth/social_account_login/presentation/view/social_account_login.dart';
import 'package:shopora/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const double _verticalPadding = 10;
  static const double _backButtonSpacing = 25;
  static const double _titleSpacing = 75;
  static const double _formSpacing = 5;
  static const double _buttonSpacing = 30;
  static const double _bottomSpacing = 20;
  static const double _horizontalPadding = 15;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: _buildMainContent(),
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
          _buildForm(),
          SizedBox(height: _formSpacing.h),
          _buildForgotPasswordButton(),
          SizedBox(height: _buttonSpacing.h),
          _buildLoginButton(),
          const Spacer(),
          _buildSocialAccountLogin(),
          SizedBox(height: _bottomSpacing.h),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: Text(
        S.of(context).login,
        style: AppTextStyles.headline1,
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const LoginForm(),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const ForgotPasswordBtn(),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const LoginButton(),
    );
  }

  Widget _buildSocialAccountLogin() {
    return const Center(child: SocialAccountLogin());
  }
}
