import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_colors.dart';
import 'package:shopora/core/config/themes/app_fonts.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';

ThemeData getlightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.shoporaBackground,

    brightness: Brightness.light,

    fontFamily: AppFonts.metropolis,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.shoporaPrimary,
      brightness: Brightness.light,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: AppFonts.metropolis,
      bodyColor: AppColors.shoporaBlack,
      displayColor: AppColors.shoporaBlack,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.shoporaPrimary,
        foregroundColor: AppColors.shoporaWhite,
        disabledBackgroundColor: AppColors.shoporaPrimary.withOpacity(0.5),
        disabledForegroundColor: AppColors.shoporaWhite.withOpacity(0.5),
        minimumSize: Size(double.infinity, 48.h),
        textStyle: AppTextStyles.fourteen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyles.fourteen.copyWith(color: AppColors.shoporaGray),
      fillColor: AppColors.shoporaWhite,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.shoporaWhite),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: AppColors.shoporaWhite),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.shoporaWhite),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.shoporaError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.shoporaError),
      ),
    ),
  );
}
