import 'package:flutter/material.dart';

class SettingEntity {
  final String name;
  final IconData iconData;
  final void Function() action;

  SettingEntity({
    required this.name,
    required this.iconData,
    required this.action,
  });
}
