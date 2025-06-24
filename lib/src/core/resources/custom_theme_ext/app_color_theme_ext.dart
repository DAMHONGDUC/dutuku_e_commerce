import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import '../app_colors.dart';

class AppColorThemeExt extends ThemeExtension<AppColorThemeExt> {
  final Color pageDefault;
  final Color textDefault;
  final Color iconDefault;
  final Color textSubTitle;
  final Color cardDefault;
  final Color boxShadowDefault;

  const AppColorThemeExt({
    required this.pageDefault,
    required this.textDefault,
    required this.iconDefault,
    required this.textSubTitle,
    required this.cardDefault,
    required this.boxShadowDefault,
  });

  // Light theme
  static AppColorThemeExt light() {
    return AppColorThemeExt(
      pageDefault: AppColors.pageDefaultLight,
      textDefault: AppColors.textDefaultLight,
      iconDefault: AppColors.iconDefaultLight,
      textSubTitle: AppColors.textSubTitleLight,
      cardDefault: AppColors.cardDefaultLight,
      boxShadowDefault: SdColors.black.withValues(alpha: 0.2),
    );
  }

  // Dark theme
  // TODO: create color for dark theme
  // for now it's have same value with light
  static AppColorThemeExt dark() {
    return AppColorThemeExt(
      pageDefault: AppColors.pageDefaultLight,
      textDefault: AppColors.textDefaultLight,
      iconDefault: AppColors.iconDefaultLight,
      textSubTitle: AppColors.textSubTitleLight,
      cardDefault: AppColors.cardDefaultLight,
      boxShadowDefault: SdColors.black.withValues(alpha: 0.3),
    );
  }

  @override
  ThemeExtension<AppColorThemeExt> copyWith({
    Color? bgPrimary,
    Color? textTitle,
    Color? iconPrimary,
    Color? textSubTitle,
    Color? cardBg,
    Color? boxShadowDefault,
  }) {
    return AppColorThemeExt(
      pageDefault: bgPrimary ?? pageDefault,
      textDefault: textTitle ?? textDefault,
      iconDefault: iconPrimary ?? iconDefault,
      textSubTitle: textSubTitle ?? this.textSubTitle,
      cardDefault: cardBg ?? cardDefault,
      boxShadowDefault: boxShadowDefault ?? this.boxShadowDefault,
    );
  }

  @override
  ThemeExtension<AppColorThemeExt> lerp(
    covariant ThemeExtension<AppColorThemeExt>? other,
    double t,
  ) {
    if (other is! AppColorThemeExt) return this;

    return AppColorThemeExt(
      pageDefault: Color.lerp(pageDefault, other.pageDefault, t) ?? pageDefault,
      textDefault: Color.lerp(textDefault, other.textDefault, t) ?? textDefault,
      iconDefault: Color.lerp(iconDefault, other.iconDefault, t) ?? iconDefault,
      textSubTitle:
          Color.lerp(textSubTitle, other.textSubTitle, t) ?? textSubTitle,
      cardDefault: Color.lerp(cardDefault, other.cardDefault, t) ?? cardDefault,
      boxShadowDefault:
          Color.lerp(boxShadowDefault, other.boxShadowDefault, t) ??
          boxShadowDefault,
    );
  }
}
