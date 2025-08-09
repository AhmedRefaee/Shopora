import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/theme_extensions/theme_extenstions.dart';
import 'package:shopora/features/settings/switch_theme/presentation/view_model/cubit/theme_cubit.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
       
        minimumSize: Size(48.h, 48.h),
      ),
        onPressed: () {
          if (context.isDarkMode) {
            context.read<ThemeCubit>().switchTheme(ThemeMode.light);
          } else {
            context.read<ThemeCubit>().switchTheme(ThemeMode.dark);
          }
        },
        child: const Icon(Icons.sunny),
      
    );
  }
}
