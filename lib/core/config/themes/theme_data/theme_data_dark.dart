import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_colors.dart' show AppColors;
import 'package:shopora/core/config/themes/app_fonts.dart';
import 'package:shopora/core/config/themes/app_text_styles.dart';

ThemeData getdarkTheme(){
return ThemeData(
    scaffoldBackgroundColor: AppColors.shoporaDarkBackground,

    brightness: Brightness.dark,

    fontFamily: AppFonts.metropolis,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.shoporaDarkPrimary,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: AppFonts.metropolis,
      bodyColor: AppColors.shoporaDarkWhite,
      displayColor: AppColors.shoporaDarkWhite,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.shoporaDarkPrimary,
        foregroundColor: AppColors.shoporaDarkWhite,
        disabledBackgroundColor: AppColors.shoporaDarkPrimary.withOpacity(0.5),
        disabledForegroundColor: AppColors.shoporaDarkWhite.withOpacity(0.5),
        minimumSize: Size(double.infinity, 48.h),
        textStyle: AppTextStyles.fourteen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyles.fourteen.copyWith(color: AppColors.shoporaDarkGray),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.shoporaDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: AppColors.shoporaDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.shoporaDark),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.shoporaDarkError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: AppColors.shoporaDarkError),
      ),
    ),
  );}