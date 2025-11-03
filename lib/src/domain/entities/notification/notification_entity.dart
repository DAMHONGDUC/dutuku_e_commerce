import 'package:dutuku_e_commerce/src/core/core.dart';

class NotificationEntity {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;
  final NotificationType type;
  final String? relatedItemId;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
    required this.type,
    this.relatedItemId,
  });
}
