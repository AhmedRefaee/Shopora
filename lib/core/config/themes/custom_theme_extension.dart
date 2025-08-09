import 'package:flutter/material.dart';
import 'package:shopora/core/config/themes/app_colors.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color error;
  final Color success;
  final Color background;
  final Color surface;
  final Color onSurface;

  const CustomColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.error,
    required this.success,
    required this.background,
    required this.surface,
    required this.onSurface,
  });

  static const light = CustomColors(
    primary: AppColors.shoporaPrimary,
    onPrimary: AppColors.shoporaWhite,
    secondary: AppColors.shoporaGray,
    error: AppColors.shoporaError,
    success: AppColors.shoporaSuccess,
    background: AppColors.shoporaBackground,
    surface: AppColors.shoporaWhite,
    onSurface: AppColors.shoporaBlack,
  );

  static const dark = CustomColors(
    primary: AppColors.shoporaDarkPrimary,
    onPrimary: AppColors.shoporaDarkWhite,
    secondary: AppColors.shoporaDarkGray,
    error: AppColors.shoporaDarkError,
    success: AppColors.shoporaDarkSuccess,
    background: AppColors.shoporaDarkBackground,
    surface: AppColors.shoporaDark,
    onSurface: AppColors.shoporaDarkWhite,
  );

  @override
  CustomColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? error,
    Color? success,
    Color? background,
    Color? surface,
    Color? onSurface,
  }) {
    return CustomColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
      success: success ?? this.success,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
    );
  }
} 