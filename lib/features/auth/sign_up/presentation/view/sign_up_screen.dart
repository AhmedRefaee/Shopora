import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/testing/testing_row.dart';
import 'package:shopora/features/auth/sign_up/presentation/view/widgets/Login_instead.dart';
import 'package:shopora/features/auth/sign_up/presentation/view/widgets/sign_up_button.dart';
import 'package:shopora/features/auth/sign_up/presentation/view/widgets/sign_up_form.dart';
import 'package:shopora/features/auth/sign_up/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:shopora/features/auth/social_account_login/presentation/view/social_account_login.dart';
import 'package:shopora/generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static const double _verticalPadding = 10;
  static const double _topSpacing = 50;
  static const double _titleSpacing = 75;
  static const double _formSpacing = 10;
  static const double _buttonSpacing = 30;
  static const double _bottomSpacing = 20;
  static const double _horizontalPadding = 15;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(child: Stack(children: [_buildMainContent()])),
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
          SizedBox(height: _topSpacing.h),
          _buildTitle(),
          SizedBox(height: _titleSpacing.h),
          _buildForm(),
          SizedBox(height: _formSpacing.h),
          _buildLoginInstead(),
          SizedBox(height: _buttonSpacing.h),
          _buildSignUpButton(),
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
      child: Text(S.of(context).signUp, style: AppTextStyles.headline1),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const SignUpForm(),
    );
  }

  Widget _buildLoginInstead() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const LoginInstead(),
    );
  }

  Widget _buildSignUpButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const SignUpButton(),
    );
  }

  Widget _buildSocialAccountLogin() {
    return const Center(child: SocialAccountLogin());
  }
}
