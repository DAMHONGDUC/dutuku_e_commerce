import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class AppColors {
  // Gray
  static const Color grey = SdColors.grey;

  // Whites
  static const Color snowWhite = Color(0xFFFFFFFF);
  static const Color snowMist = Color(0xFFF9FAFF);

  // Primary Brand
  static const Color primary = Color(0xFF504EB7);

  // Text
  static const Color textTitleLight = Color(0xFF1A1A1A);
  static final Color textSubTitleLight = SdColors.grey800;
  static final Color textTitleDark = SdColors.grey100;
  static final Color textSubTitleDark = SdColors.grey200;

  // Icon
  static final Color iconPrimaryLight = const Color(0xFF434750);
  static final Color iconPrimaryDark = Color(0xFF60A5FA);

  // Card
  static const Color cardBgLight = snowWhite;
  static final Color cardBgDark = SdColors.grey800;
  static const Color cardShadowLight = Color.fromRGBO(0, 0, 0, 0.05);
  static const Color cardShadowDark = Color.fromRGBO(0, 0, 0, 0.3);

  // Background
  static const Color bgPrimaryLight = snowWhite;
  static const Color bgSecondaryLight = snowMist;
  static final Color bgPrimaryDark = SdColors.grey900;
  static const Color bgSecondaryDark = Color(0xFF1C232B);
}
