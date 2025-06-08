import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeColor extends ThemeExtension<AppThemeColor> {
  final Color bgPrimary;

  AppThemeColor({required this.bgPrimary});

  // Light
  static AppThemeColor light() {
    return AppThemeColor(
      // bg
      bgPrimary: AppColors.bgPrimaryLight,
    );
  }

  // Dark
  static AppThemeColor dark() {
    return AppThemeColor(
      // bg
      bgPrimary: AppColors.bgPrimaryDark,
    );
  }

  @override
  ThemeExtension<AppThemeColor> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppThemeColor> lerp(
    covariant ThemeExtension<AppThemeColor>? other,
    double t,
  ) {
    return this;
  }
}
