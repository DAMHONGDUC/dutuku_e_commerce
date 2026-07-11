import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/models/notification_model.dart';
import 'package:dutuku_e_commerce/src/features/notification/domain/entities/notification_entity.dart';

class NotificationModelToNotificationEntityMapper {
  const NotificationModelToNotificationEntityMapper._();

  static NotificationEntity toEntity(NotificationModel model) {
    return NotificationEntity(
      id: model.id ?? '',
      title: model.title ?? '',
      body: model.body ?? '',
      timestamp: model.timestamp ?? DateTime.now(),
      isRead: model.isRead ?? false,
      type: model.type ?? NotificationType.general,
      relatedItemId: model.relatedItemId,
    );
  }
}
