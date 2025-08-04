import 'package:flutter/material.dart';
import 'package:shopora/core/config/themes/theme_data/theme_data_dark.dart';
import 'package:shopora/core/config/themes/theme_data/theme_data_light.dart';
import 'package:shopora/features/auth/login/presentation/view/login_screen.dart';

void main() {
  runApp(const Shopora());
}

class Shopora extends StatelessWidget {
  const Shopora({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getlightTheme(),
      darkTheme: getdarkTheme(),
      themeMode: ThemeMode.light,
      home: LoginScreen(),
    );
  }
}
