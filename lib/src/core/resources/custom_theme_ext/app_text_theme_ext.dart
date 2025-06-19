import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class AppTextThemeExt extends ThemeExtension<AppTextThemeExt> {
  // Body styles
  final TextStyle body6;
  final TextStyle body8;
  final TextStyle body9;
  final TextStyle body10;
  final TextStyle body12;
  final TextStyle body14;
  final TextStyle body16;
  final TextStyle body18;
  final TextStyle body20;
  final TextStyle body24;
  final TextStyle body32;
  final TextStyle body40;
  final TextStyle body48;
  final TextStyle body56;
  final TextStyle body64;
  final TextStyle body72;

  // Heading styles
  final TextStyle heading6;
  final TextStyle heading8;
  final TextStyle heading9;
  final TextStyle heading10;
  final TextStyle heading12;
  final TextStyle heading13;
  final TextStyle heading14;
  final TextStyle heading16;
  final TextStyle heading18;
  final TextStyle heading20;
  final TextStyle heading24;
  final TextStyle heading28;
  final TextStyle heading32;
  final TextStyle heading40;
  final TextStyle heading48;
  final TextStyle heading56;
  final TextStyle heading64;
  final TextStyle heading72;

  AppTextThemeExt({
    // Body styles
    required this.body6,
    required this.body8,
    required this.body9,
    required this.body10,
    required this.body12,
    required this.body14,
    required this.body16,
    required this.body18,
    required this.body20,
    required this.body24,
    required this.body32,
    required this.body40,
    required this.body48,
    required this.body56,
    required this.body64,
    required this.body72,

    // Heading styles
    required this.heading6,
    required this.heading8,
    required this.heading9,
    required this.heading10,
    required this.heading12,
    required this.heading13,
    required this.heading14,
    required this.heading16,
    required this.heading18,
    required this.heading20,
    required this.heading24,
    required this.heading28,
    required this.heading32,
    required this.heading40,
    required this.heading48,
    required this.heading56,
    required this.heading64,
    required this.heading72,
  });

  // Light theme text styles
  static AppTextThemeExt light() {
    return AppTextThemeExt(
      // Body styles
      body6: SdTextStyle.body6(),
      body8: SdTextStyle.body8(),
      body9: SdTextStyle.body9(),
      body10: SdTextStyle.body10(),
      body12: SdTextStyle.body12(),
      body14: SdTextStyle.body14(),
      body16: SdTextStyle.body16(),
      body18: SdTextStyle.body18(),
      body20: SdTextStyle.body20(),
      body24: SdTextStyle.body24(),
      body32: SdTextStyle.body32(),
      body40: SdTextStyle.body40(),
      body48: SdTextStyle.body48(),
      body56: SdTextStyle.body56(),
      body64: SdTextStyle.body64(),
      body72: SdTextStyle.body72(),

      // Heading styles
      heading6: SdTextStyle.heading6(),
      heading8: SdTextStyle.heading8(),
      heading9: SdTextStyle.heading9(),
      heading10: SdTextStyle.heading10(),
      heading12: SdTextStyle.heading12(),
      heading13: SdTextStyle.heading13(),
      heading14: SdTextStyle.heading14(),
      heading16: SdTextStyle.heading16(),
      heading18: SdTextStyle.heading18(),
      heading20: SdTextStyle.heading20(),
      heading24: SdTextStyle.heading24(),
      heading28: SdTextStyle.heading28(),
      heading32: SdTextStyle.heading32(),
      heading40: SdTextStyle.heading40(),
      heading48: SdTextStyle.heading48(),
      heading56: SdTextStyle.heading56(),
      heading64: SdTextStyle.heading64(),
      heading72: SdTextStyle.heading72(),
    );
  }

  // Dark theme text styles (with adjusted colors for dark theme)
  static AppTextThemeExt dark() {
    return AppTextThemeExt(
      // Body styles
      body6: SdTextStyle.body6().wColor(SdColors.white),
      body8: SdTextStyle.body8().wColor(SdColors.white),
      body9: SdTextStyle.body9().wColor(SdColors.white),
      body10: SdTextStyle.body10().wColor(SdColors.white),
      body12: SdTextStyle.body12().wColor(SdColors.white),
      body14: SdTextStyle.body14().wColor(SdColors.white),
      body16: SdTextStyle.body16().wColor(SdColors.white),
      body18: SdTextStyle.body18().wColor(SdColors.white),
      body20: SdTextStyle.body20().wColor(SdColors.white),
      body24: SdTextStyle.body24().wColor(SdColors.white),
      body32: SdTextStyle.body32().wColor(SdColors.white),
      body40: SdTextStyle.body40().wColor(SdColors.white),
      body48: SdTextStyle.body48().wColor(SdColors.white),
      body56: SdTextStyle.body56().wColor(SdColors.white),
      body64: SdTextStyle.body64().wColor(SdColors.white),
      body72: SdTextStyle.body72().wColor(SdColors.white),

      // Heading styles
      heading6: SdTextStyle.heading6().wColor(SdColors.white),
      heading8: SdTextStyle.heading8().wColor(SdColors.white),
      heading9: SdTextStyle.heading9().wColor(SdColors.white),
      heading10: SdTextStyle.heading10().wColor(SdColors.white),
      heading12: SdTextStyle.heading12().wColor(SdColors.white),
      heading13: SdTextStyle.heading13().wColor(SdColors.white),
      heading14: SdTextStyle.heading14().wColor(SdColors.white),
      heading16: SdTextStyle.heading16().wColor(SdColors.white),
      heading18: SdTextStyle.heading18().wColor(SdColors.white),
      heading20: SdTextStyle.heading20().wColor(SdColors.white),
      heading24: SdTextStyle.heading24().wColor(SdColors.white),
      heading28: SdTextStyle.heading28().wColor(SdColors.white),
      heading32: SdTextStyle.heading32().wColor(SdColors.white),
      heading40: SdTextStyle.heading40().wColor(SdColors.white),
      heading48: SdTextStyle.heading48().wColor(SdColors.white),
      heading56: SdTextStyle.heading56().wColor(SdColors.white),
      heading64: SdTextStyle.heading64().wColor(SdColors.white),
      heading72: SdTextStyle.heading72().wColor(SdColors.white),
    );
  }

  @override
  ThemeExtension<AppTextThemeExt> copyWith({
    // Body styles
    TextStyle? body6,
    TextStyle? body8,
    TextStyle? body9,
    TextStyle? body10,
    TextStyle? body12,
    TextStyle? body14,
    TextStyle? body16,
    TextStyle? body18,
    TextStyle? body20,
    TextStyle? body24,
    TextStyle? body32,
    TextStyle? body40,
    TextStyle? body48,
    TextStyle? body56,
    TextStyle? body64,
    TextStyle? body72,

    // Heading styles
    TextStyle? heading6,
    TextStyle? heading8,
    TextStyle? heading9,
    TextStyle? heading10,
    TextStyle? heading12,
    TextStyle? heading13,
    TextStyle? heading14,
    TextStyle? heading16,
    TextStyle? heading18,
    TextStyle? heading20,
    TextStyle? heading24,
    TextStyle? heading28,
    TextStyle? heading32,
    TextStyle? heading40,
    TextStyle? heading48,
    TextStyle? heading56,
    TextStyle? heading64,
    TextStyle? heading72,
  }) {
    return AppTextThemeExt(
      // Body styles
      body6: body6 ?? this.body6,
      body8: body8 ?? this.body8,
      body9: body9 ?? this.body9,
      body10: body10 ?? this.body10,
      body12: body12 ?? this.body12,
      body14: body14 ?? this.body14,
      body16: body16 ?? this.body16,
      body18: body18 ?? this.body18,
      body20: body20 ?? this.body20,
      body24: body24 ?? this.body24,
      body32: body32 ?? this.body32,
      body40: body40 ?? this.body40,
      body48: body48 ?? this.body48,
      body56: body56 ?? this.body56,
      body64: body64 ?? this.body64,
      body72: body72 ?? this.body72,

      // Heading styles
      heading6: heading6 ?? this.heading6,
      heading8: heading8 ?? this.heading8,
      heading9: heading9 ?? this.heading9,
      heading10: heading10 ?? this.heading10,
      heading12: heading12 ?? this.heading12,
      heading13: heading13 ?? this.heading13,
      heading14: heading14 ?? this.heading14,
      heading16: heading16 ?? this.heading16,
      heading18: heading18 ?? this.heading18,
      heading20: heading20 ?? this.heading20,
      heading24: heading24 ?? this.heading24,
      heading28: heading28 ?? this.heading28,
      heading32: heading32 ?? this.heading32,
      heading40: heading40 ?? this.heading40,
      heading48: heading48 ?? this.heading48,
      heading56: heading56 ?? this.heading56,
      heading64: heading64 ?? this.heading64,
      heading72: heading72 ?? this.heading72,
    );
  }

  @override
  ThemeExtension<AppTextThemeExt> lerp(
    covariant ThemeExtension<AppTextThemeExt>? other,
    double t,
  ) {
    if (other is! AppTextThemeExt) return this;

    return AppTextThemeExt(
      // Body styles
      body6: TextStyle.lerp(body6, other.body6, t)!,
      body8: TextStyle.lerp(body8, other.body8, t)!,
      body9: TextStyle.lerp(body9, other.body9, t)!,
      body10: TextStyle.lerp(body10, other.body10, t)!,
      body12: TextStyle.lerp(body12, other.body12, t)!,
      body14: TextStyle.lerp(body14, other.body14, t)!,
      body16: TextStyle.lerp(body16, other.body16, t)!,
      body18: TextStyle.lerp(body18, other.body18, t)!,
      body20: TextStyle.lerp(body20, other.body20, t)!,
      body24: TextStyle.lerp(body24, other.body24, t)!,
      body32: TextStyle.lerp(body32, other.body32, t)!,
      body40: TextStyle.lerp(body40, other.body40, t)!,
      body48: TextStyle.lerp(body48, other.body48, t)!,
      body56: TextStyle.lerp(body56, other.body56, t)!,
      body64: TextStyle.lerp(body64, other.body64, t)!,
      body72: TextStyle.lerp(body72, other.body72, t)!,

      // Heading styles
      heading6: TextStyle.lerp(heading6, other.heading6, t)!,
      heading8: TextStyle.lerp(heading8, other.heading8, t)!,
      heading9: TextStyle.lerp(heading9, other.heading9, t)!,
      heading10: TextStyle.lerp(heading10, other.heading10, t)!,
      heading12: TextStyle.lerp(heading12, other.heading12, t)!,
      heading13: TextStyle.lerp(heading13, other.heading13, t)!,
      heading14: TextStyle.lerp(heading14, other.heading14, t)!,
      heading16: TextStyle.lerp(heading16, other.heading16, t)!,
      heading18: TextStyle.lerp(heading18, other.heading18, t)!,
      heading20: TextStyle.lerp(heading20, other.heading20, t)!,
      heading24: TextStyle.lerp(heading24, other.heading24, t)!,
      heading28: TextStyle.lerp(heading28, other.heading28, t)!,
      heading32: TextStyle.lerp(heading32, other.heading32, t)!,
      heading40: TextStyle.lerp(heading40, other.heading40, t)!,
      heading48: TextStyle.lerp(heading48, other.heading48, t)!,
      heading56: TextStyle.lerp(heading56, other.heading56, t)!,
      heading64: TextStyle.lerp(heading64, other.heading64, t)!,
      heading72: TextStyle.lerp(heading72, other.heading72, t)!,
    );
  }
}
