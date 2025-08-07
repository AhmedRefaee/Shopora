import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/features/switch_locale/presentation/view/switch_locale_button.dart';
import 'package:shopora/features/switch_theme/presentation/view/switch_theme_button.dart';
import 'package:shopora/core/config/localization/locales/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentWidth = MediaQuery.of(context).size.width.toInt();
    final int currentHeight = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${currentWidth.toString()}", style: AppTextStyles.headline1),
              Text("${currentHeight.toString()}", style: AppTextStyles.headline1),
              Text(S.of(context).login, style: AppTextStyles.headline1),

              SizedBox(height: 25.h),
              TextField(
                decoration: InputDecoration(labelText: S.of(context).email),
              ),
              SizedBox(height: 16.h),
              TextField(
                decoration: InputDecoration(labelText: S.of(context).password),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {},
                child: Text(S.of(context).login),
              ),

              SizedBox(height: 16.h),
              SwitchThemeButton(),
              SizedBox(height: 16.h),
              SwitchLocaleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
