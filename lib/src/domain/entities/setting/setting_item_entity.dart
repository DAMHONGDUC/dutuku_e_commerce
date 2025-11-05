import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';

class SettingItemEntity {
  final String name;
  final IconData iconData;
  final SettingItemType itemType;

  SettingItemEntity({
    required this.name,
    required this.iconData,
    required this.itemType,
  });
}
