import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/models/notification_category_model.dart';
import 'package:dutuku_e_commerce/src/features/notification/domain/entities/notification_category_entity.dart';
import 'package:flutter/material.dart';

class NotificationCategoryModelToNotificationCategoryMapper {
  const NotificationCategoryModelToNotificationCategoryMapper._();

  static NotificationCategory toEntity(NotificationCategoryModel model) {
    return NotificationCategory(
      name: model.name ?? '',
      description: model.description ?? '',
      icon: model.icon ?? Icons.notifications_none,
      type: model.type ?? NotificationCategoryType.general,
      numOfNotifications: model.numOfNotifications ?? 0,
    );
  }
}
