import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import '../app_colors.dart';

class AppColorThemeExt extends ThemeExtension<AppColorThemeExt> {
  final Color pageDefault;
  final Color textDefault;
  final Color iconDefault;
  final Color iconSecondary;
  final Color textSubTitle;
  final Color cardDefault;
  final Color boxShadowDefault;
  final Color borderDefault;
  final Color indicatorActive;
  final Color indicatorBg;
  final Color primary;

  const AppColorThemeExt({
    required this.pageDefault,
    required this.textDefault,
    required this.iconDefault,
    required this.iconSecondary,
    required this.textSubTitle,
    required this.cardDefault,
    required this.boxShadowDefault,
    required this.borderDefault,
    required this.indicatorActive,
    required this.indicatorBg,
    required this.primary,
  });

  // Light theme
  static AppColorThemeExt light() {
    return AppColorThemeExt(
      pageDefault: AppColors.pageDefaultLight,
      textDefault: AppColors.textDefaultLight,
      iconDefault: AppColors.iconDefaultLight,
      iconSecondary: SdColors.grey.withValues(alpha: 0.9),
      textSubTitle: AppColors.textSubTitleLight,
      cardDefault: AppColors.cardDefaultLight,
      boxShadowDefault: SdColors.black.withValues(alpha: 0.2),
      borderDefault: SdColors.grey.withValues(alpha: 0.9),
      indicatorActive: AppColors.primary,
      indicatorBg: SdColors.grey.withValues(alpha: 0.3),
      primary: AppColors.primary,
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
      iconSecondary: SdColors.grey.withValues(alpha: 0.9),
      textSubTitle: AppColors.textSubTitleLight,
      cardDefault: AppColors.cardDefaultLight,
      boxShadowDefault: SdColors.black.withValues(alpha: 0.3),
      borderDefault: SdColors.grey.withValues(alpha: 0.2),
      indicatorActive: AppColors.primary,
      indicatorBg: SdColors.grey.withValues(alpha: 0.2),
      primary: AppColors.primary,
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

  // @override
  // ThemeExtension<AppColorThemeExt> copyWith({
  //   Color? bgPrimary,
  //   Color? textTitle,
  //   Color? iconPrimary,
  //   Color? textSubTitle,
  //   Color? cardBg,
  //   Color? boxShadowDefault,
  // }) {
  //   return AppColorThemeExt(
  //     pageDefault: bgPrimary ?? pageDefault,
  //     textDefault: textTitle ?? textDefault,
  //     iconDefault: iconPrimary ?? iconDefault,
  //     textSubTitle: textSubTitle ?? this.textSubTitle,
  //     cardDefault: cardBg ?? cardDefault,
  //     boxShadowDefault: boxShadowDefault ?? this.boxShadowDefault,
  //   );
  // }

  // @override
  // ThemeExtension<AppColorThemeExt> lerp(
  //   covariant ThemeExtension<AppColorThemeExt>? other,
  //   double t,
  // ) {
  //   if (other is! AppColorThemeExt) return this;

  //   return AppColorThemeExt(
  //     pageDefault: Color.lerp(pageDefault, other.pageDefault, t) ?? pageDefault,
  //     textDefault: Color.lerp(textDefault, other.textDefault, t) ?? textDefault,
  //     iconDefault: Color.lerp(iconDefault, other.iconDefault, t) ?? iconDefault,
  //     textSubTitle:
  //         Color.lerp(textSubTitle, other.textSubTitle, t) ?? textSubTitle,
  //     cardDefault: Color.lerp(cardDefault, other.cardDefault, t) ?? cardDefault,
  //     boxShadowDefault:
  //         Color.lerp(boxShadowDefault, other.boxShadowDefault, t) ??
  //         boxShadowDefault,
  //   );
  // }
}
