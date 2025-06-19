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
  ThemeExtension<AppColorThemeExt> copyWith({Color? bgPrimary}) {
    return AppColorThemeExt(bgPrimary: bgPrimary ?? this.bgPrimary);
  }

  @override
  ThemeExtension<AppColorThemeExt> lerp(
    covariant ThemeExtension<AppColorThemeExt>? other,
    double t,
  ) {
    if (other is! AppColorThemeExt) return this;

    return AppColorThemeExt(
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t) ?? bgPrimary,
    );
  }
}
