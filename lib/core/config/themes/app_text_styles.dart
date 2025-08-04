import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shopora/core/config/themes/app_fonts.dart';

class AppTextStyles {
  const AppTextStyles._();
  static const TextStyle headline1 = TextStyle(
    fontSize: 34,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );

  static final TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.2,
  );

  static final TextStyle headline3 = TextStyle(
    fontSize: 18,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.2,
  );

  static final TextStyle description = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w400,
    letterSpacing: -15,
    height: 1.5,
  );

  static final TextStyle fourteen = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.5,
  );

  static final TextStyle sixteen = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,

  );

  static final TextStyle eleven = TextStyle(
    fontSize: 11,
    fontFamily: AppFonts.metropolis,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,

  );
}
