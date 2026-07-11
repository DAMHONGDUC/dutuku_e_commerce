import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';

class SettingItemModel {
  final String? name;
  final IconData? iconData;
  final SettingItemType? itemType;
  final Color? iconColor;
  final Color? nameColor;

  const SettingItemModel({
    this.name,
    this.iconData,
    this.itemType,
    this.iconColor,
    this.nameColor,
  });
}
