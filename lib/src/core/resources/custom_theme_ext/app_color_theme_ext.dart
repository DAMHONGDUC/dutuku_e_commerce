import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppColorThemeExt extends ThemeExtension<AppColorThemeExt> {
  final Color bgPrimary;
  final Color textTitle;
  final Color iconPrimary;
  final Color textSubTitle;
  final Color cardBg;
  final Color cardShadow;

  const AppColorThemeExt({
    required this.bgPrimary,
    required this.textTitle,
    required this.iconPrimary,
    required this.textSubTitle,
    required this.cardBg,
    required this.cardShadow,
  });

  // Light theme
  static AppColorThemeExt light() {
    return AppColorThemeExt(
      bgPrimary: AppColors.bgPrimaryLight,
      textTitle: AppColors.textTitleLight,
      iconPrimary: AppColors.iconPrimaryLight,
      textSubTitle: AppColors.textSubTitleLight,
      cardBg: AppColors.cardBgLight,
      cardShadow: AppColors.cardShadowLight,
    );
  }

  // Dark theme
  static AppColorThemeExt dark() {
    return AppColorThemeExt(
      bgPrimary: AppColors.bgPrimaryDark,
      textTitle: AppColors.textTitleDark,
      iconPrimary: AppColors.iconPrimaryDark,
      textSubTitle: AppColors.textSubTitleDark,
      cardBg: AppColors.cardBgDark,
      cardShadow: AppColors.cardShadowDark,
    );
  }

  @override
  ThemeExtension<AppColorThemeExt> copyWith({
    Color? bgPrimary,
    Color? textTitle,
    Color? iconPrimary,
    Color? textSubTitle,
    Color? cardBg,
    Color? cardShadow,
  }) {
    return AppColorThemeExt(
      bgPrimary: bgPrimary ?? this.bgPrimary,
      textTitle: textTitle ?? this.textTitle,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      textSubTitle: textSubTitle ?? this.textSubTitle,
      cardBg: cardBg ?? this.cardBg,
      cardShadow: cardShadow ?? this.cardShadow,
    );
  }

  @override
  ThemeExtension<AppColorThemeExt> lerp(
    covariant ThemeExtension<AppColorThemeExt>? other,
    double t,
  ) {
    if (other is! AppColorThemeExt) return this;

    return AppColorThemeExt(
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t) ?? bgPrimary,
      textTitle: Color.lerp(textTitle, other.textTitle, t) ?? textTitle,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t) ?? iconPrimary,
      textSubTitle:
          Color.lerp(textSubTitle, other.textSubTitle, t) ?? textSubTitle,
      cardBg: Color.lerp(cardBg, other.cardBg, t) ?? cardBg,
      cardShadow: Color.lerp(cardShadow, other.cardShadow, t) ?? cardShadow,
    );
  }
}
