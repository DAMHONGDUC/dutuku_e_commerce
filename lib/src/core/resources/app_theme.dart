import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system_design_flutter/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme_color.dart';

class AppTheme {
  static ThemeData buildLightTheme() {
    final baseTheme = ThemeData(brightness: Brightness.light);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(buildSdTextTheme(isDark: false)),
      extensions: [AppThemeColor.light()],
    );
  }

  static ThemeData buildDarkTheme() {
    final baseTheme = ThemeData(brightness: Brightness.dark);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(buildSdTextTheme(isDark: true)),
      extensions: [AppThemeColor.dark()],
    );
  }

  static TextTheme buildSdTextTheme({bool isDark = false}) {
    final color = isDark ? SdColors.white : SdColors.black;

    return TextTheme(
      displayLarge: SdBaseTextStyle.base(fontSize: 57.sp).wColor(color),
      displayMedium: SdBaseTextStyle.base(fontSize: 45.sp).wColor(color),
      displaySmall: SdBaseTextStyle.base(fontSize: 36.sp).wColor(color),

      headlineLarge: SdBaseTextStyle.base(fontSize: 32.sp).wColor(color),
      headlineMedium: SdBaseTextStyle.base(fontSize: 28.sp).wColor(color),
      headlineSmall: SdBaseTextStyle.base(fontSize: 24.sp).wColor(color),

      titleLarge: SdBaseTextStyle.base(
        fontSize: 22.sp,
      ).wColor(color).wSemiBold(),
      titleMedium: SdBaseTextStyle.base(
        fontSize: 16.sp,
      ).wSemiBold().wColor(color),
      titleSmall: SdBaseTextStyle.base(
        fontSize: 14.sp,
      ).wSemiBold().wColor(color),

      bodyLarge: SdBaseTextStyle.base(fontSize: 16.sp).wColor(color),
      bodyMedium: SdBaseTextStyle.base(fontSize: 14.sp).wColor(color),
      bodySmall: SdBaseTextStyle.base(fontSize: 12.sp).wColor(color),

      labelLarge: SdBaseTextStyle.base(fontSize: 14.sp).wColor(color),
      labelMedium: SdBaseTextStyle.base(fontSize: 12.sp).wColor(color),
      labelSmall: SdBaseTextStyle.base(fontSize: 11.sp).wColor(color),
    );
  }
}

// display =>	Splash screen, hero page
// headline =>	Section/page titles
// title =>	Cards, app bars, subtitles
// body =>	Main content text
// label =>	Buttons, badges, tiny labels
