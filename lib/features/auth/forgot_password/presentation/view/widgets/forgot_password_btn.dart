import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/core/utils/elements/forward_arrow_icon.dart';
import 'package:shopora/generated/l10n.dart';

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).forgotPassword,
              style: AppTextStyles.fourteen.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(width: 5.w),
            const ForwardArrowIcon(),
          ],
        ),
      ),
    );
  }
}
