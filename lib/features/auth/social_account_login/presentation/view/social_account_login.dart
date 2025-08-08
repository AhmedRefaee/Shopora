import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/generated/l10n.dart';
import 'package:shopora/features/auth/social_account_login/presentation/view/widgets/social_login_button.dart';

class SocialAccountLogin extends StatelessWidget {
  const SocialAccountLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).orLoginWithSocialAccount,
          style: AppTextStyles.fourteen,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 200.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialLoginButton(
                iconPath: "assets/images/icons/google_icon.svg",
                onPressed: () {},
              ),
              SocialLoginButton(
                iconPath: "assets/images/icons/facebook_icon.svg",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
