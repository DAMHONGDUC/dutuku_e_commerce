import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppColorThemeExt extends ThemeExtension<AppColorThemeExt> {
  final Color bgPrimary;

  AppColorThemeExt({required this.bgPrimary});

  // Light
  static AppColorThemeExt light() {
    return AppColorThemeExt(
      // bg
      bgPrimary: AppColors.bgPrimaryLight,
    );
  }

  // Dark
  static AppColorThemeExt dark() {
    return AppColorThemeExt(
      // bg
      bgPrimary: AppColors.bgPrimaryDark,
    );
  }

  @override
  ThemeExtension<AppColorThemeExt> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorThemeExt> lerp(
    covariant ThemeExtension<AppColorThemeExt>? other,
    double t,
  ) {
    return this;
  }
}
