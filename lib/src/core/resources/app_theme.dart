import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme_color.dart';

class AppTheme {
  static ThemeData buildLightTheme() {
    var baseTheme = ThemeData(brightness: Brightness.light);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
      extensions: [AppThemeColor.light()],
    );
  }

  static ThemeData buildDarkTheme() {
    var baseTheme = ThemeData(brightness: Brightness.dark);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
      extensions: [AppThemeColor.dark()],
    );
  }
}
