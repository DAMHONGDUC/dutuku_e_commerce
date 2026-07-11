import 'package:flutter/material.dart';

import 'custom_theme_ext/app_color_theme_ext.dart';
import 'custom_theme_ext/app_text_theme_ext.dart';

extension ThemeExt on BuildContext {
  AppColorThemeExt get colorTheme =>
      Theme.of(this).extension<AppColorThemeExt>()!;

  AppTextThemeExt get textTheme => Theme.of(this).extension<AppTextThemeExt>()!;
}
