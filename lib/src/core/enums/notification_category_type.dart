import 'package:flutter/material.dart';

enum NotificationCategoryType {
  promotion,
  liveVideo,
  financial,
  update,
  award,
  general,
}

extension NotificationCategoryTypeExt on NotificationCategoryType {
  Color get iconColor {
    switch (this) {
      case NotificationCategoryType.promotion:
        return Colors.pink.shade600;
      case NotificationCategoryType.liveVideo:
        return Colors.red.shade600;
      case NotificationCategoryType.financial:
        return Colors.green.shade600;
      case NotificationCategoryType.update:
        return Colors.blue.shade600;
      case NotificationCategoryType.award:
        return Colors.amber.shade600;
      case NotificationCategoryType.general:
        return Colors.grey.shade600;
    }
  }
}
