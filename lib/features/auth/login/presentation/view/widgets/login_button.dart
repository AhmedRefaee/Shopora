import 'package:flutter/material.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/generated/l10n.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        S.of(context).login,
        style: AppTextStyles.sixteen,
      ),
    );
  }
}
