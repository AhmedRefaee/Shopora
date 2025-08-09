import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/themes/app_fonts.dart';

class AppTextStyles {
  const AppTextStyles._();
  static TextStyle get headline1 => TextStyle(
    fontSize: 34.sp,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );

  static TextStyle get headline2 => TextStyle(
    fontSize: 24.sp,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.2,
  );

  static TextStyle get headline3 => TextStyle(
    fontSize: 18.sp,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.2,
  );

  static TextStyle get description => TextStyle(
    fontSize: 14.sp,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25, // Fixed from -15
    height: 1.5,
  );

  static TextStyle get fourteen => TextStyle(
    fontSize: 14.sp,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.5,
  );

  static TextStyle get sixteen => TextStyle(
    fontSize: 16.sp,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  static TextStyle get eleven => TextStyle(
    fontSize: 11.sp,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
}
