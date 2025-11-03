import 'package:flutter/material.dart';

enum NotificationType { orderUpdate, promotion, newProduct, account, general }

extension NotificationTypeExt on NotificationType {
  IconData get iconData {
    switch (this) {
      case NotificationType.orderUpdate:
        return Icons.local_shipping_outlined;
      case NotificationType.promotion:
        return Icons.campaign_outlined;
      case NotificationType.newProduct:
        return Icons.whatshot_outlined;
      case NotificationType.account:
        return Icons.person_outline;
      case NotificationType.general:
        return Icons.notifications_none;
    }
  }
}
