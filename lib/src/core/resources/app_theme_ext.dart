import 'package:flutter/material.dart';

import 'app_theme_color.dart';

extension ThemeExtension on BuildContext {
  AppThemeColor get appThemeColor => Theme.of(this).extension<AppThemeColor>()!;
}

extension TextThemeExt on BuildContext {
  TextTheme get appTextTheme => Theme.of(this).textTheme;
}
