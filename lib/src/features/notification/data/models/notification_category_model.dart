import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';

class NotificationCategoryModel {
  final String? name;
  final String? description;
  final IconData? icon;
  final NotificationCategoryType? type;
  final int? numOfNotifications;

  const NotificationCategoryModel({
    this.name,
    this.description,
    this.icon,
    this.type,
    this.numOfNotifications,
  });
}
