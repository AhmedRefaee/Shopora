import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/config/themes/theme_extensions/theme_extenstions.dart';
import 'package:shopora/features/switch_theme/presentation/view_model/cubit/theme_cubit.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ElevatedButton(
        onPressed: () {
          if (context.isDarkMode) {
            context.read<ThemeCubit>().switchTheme(ThemeMode.light);
          } else {
            context.read<ThemeCubit>().switchTheme(ThemeMode.dark);
          }
        },
        child: const Icon(Icons.sunny),
      ),
    );
  }
}
