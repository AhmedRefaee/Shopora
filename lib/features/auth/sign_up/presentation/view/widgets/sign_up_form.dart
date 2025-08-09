
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/utils/widgets/custom_textfield.dart';
import 'package:shopora/generated/l10n.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextfield(
            label: S.of(context).name,
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 10.h),
          CustomTextfield(
            label: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.h),
          CustomTextfield(
            label: S.of(context).password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            enableVisibilityToggle: true,
          ),
        ],
      ),
    );
  }
}
