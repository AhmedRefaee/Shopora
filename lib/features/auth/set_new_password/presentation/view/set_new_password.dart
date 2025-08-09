import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/elements/back_arrow_button.dart';
import 'package:shopora/features/auth/set_new_password/presentation/view/widgets/new_password_form.dart';
import 'package:shopora/features/auth/set_new_password/presentation/view/widgets/save_button.dart';
import 'package:shopora/features/auth/set_new_password/presentation/view_model/set_new_password_cubit/set_new_password_cubit.dart';
import 'package:shopora/generated/l10n.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  static const double _verticalPadding = 10;
  static const double _titleSpacing = 25;
  static const double _formSpacing = 75;
  static const double _buttonSpacing = 70;
  static const double _horizontalPadding = 15;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetNewPasswordCubit(),
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
          const BackArrowButton(),
          SizedBox(height: _titleSpacing.h),
          _buildTitle(),
          SizedBox(height: _formSpacing.h),
          _buildForm(),
          SizedBox(height: _buttonSpacing.h),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: Text(
        S.of(context).setANewPassword,
        style: AppTextStyles.headline1,
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const NewPasswordForm(),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
      child: const SaveButton(),
    );
  }
}
