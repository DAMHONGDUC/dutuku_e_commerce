import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class AppColors {
  // Gray
  static const Color grey = SdColors.grey;

  // Whites
  static const Color white = SdColors.white;
  static const Color snowMist = Color(0xFFF9FAFF);

  // Primary Brand
  static const Color primary = Color(0xFF504EB7);

  // Light
  static const Color textDefaultLight = Color(0xFF000000);
  static final Color textSubTitleLight = Color(0xFFa7a9af);
  static const Color cardDefaultLight = white;
  static const Color pageDefaultLight = white;
  static const Color pageSecondaryLight = snowMist;
  static final Color iconDefaultLight = const Color(0xFF434750);

  // Dark
  // TODO: create color for dark theme
  static final Color textDefaultDark = SdColors.grey100;
}
