import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_theme_ext/app_color_theme_ext.dart';
import 'custom_theme_ext/app_text_theme_ext.dart';

class AppTheme {
  static ThemeData buildLightTheme() {
    final baseTheme = ThemeData(brightness: Brightness.light);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
      extensions: [AppColorThemeExt.light(), AppTextThemeExt.light()],
    );
  }

  static ThemeData buildDarkTheme() {
    final baseTheme = ThemeData(brightness: Brightness.dark);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
      extensions: [AppColorThemeExt.dark(), AppTextThemeExt.dark()],
    );
  }
}
