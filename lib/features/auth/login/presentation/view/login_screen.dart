import 'package:flutter/material.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';
import 'package:shopora/features/switch_locale/presentation/view/switch_locale_button.dart';
import 'package:shopora/features/switch_theme/presentation/view/switch_theme_button.dart';
import 'package:shopora/core/config/localization/locales/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).login,
                style: AppTextStyles.headline1,
              ),

              const SizedBox(height: 25),
              TextField(
                decoration: InputDecoration(
                  labelText: S.of(context).email,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: S.of(context).password,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text(S.of(context).login)),

              const SizedBox(height: 16),
              SwitchThemeButton(),
              const SizedBox(height: 16),
              SwitchLocaleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
