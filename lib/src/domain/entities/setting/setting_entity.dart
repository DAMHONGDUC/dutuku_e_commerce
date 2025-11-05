import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';

class SettingEntity {
  final String name;
  final IconData iconData;
  final SettingItemType type;

  SettingEntity({
    required this.name,
    required this.iconData,
    required this.type,
  });
}
