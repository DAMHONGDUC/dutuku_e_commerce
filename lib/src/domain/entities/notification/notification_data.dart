import 'package:dutuku_e_commerce/src/domain/entities/notification/notification_category_entity.dart';
import 'package:dutuku_e_commerce/src/domain/entities/notification/notification_entity.dart';

class NotificationData {
  final List<NotificationEntity> listNotification;
  final List<NotificationCategory> listNotificationCategory;

  NotificationData({
    required this.listNotification,
    required this.listNotificationCategory,
  });
}
