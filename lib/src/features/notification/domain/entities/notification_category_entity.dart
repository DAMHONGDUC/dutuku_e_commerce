import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';

class NotificationCategory {
  final String name;
  final String description;
  final IconData icon;
  final NotificationCategoryType type;
  final int numOfNotifications;

  NotificationCategory({
    required this.name,
    required this.description,
    required this.icon,
    required this.type,
    required this.numOfNotifications,
  });
}
