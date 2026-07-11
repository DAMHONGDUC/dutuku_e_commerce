import 'package:dutuku_e_commerce/src/core/core.dart';

class NotificationModel {
  final String? id;
  final String? title;
  final String? body;
  final DateTime? timestamp;
  final bool? isRead;
  final NotificationType? type;
  final String? relatedItemId;

  const NotificationModel({
    this.id,
    this.title,
    this.body,
    this.timestamp,
    this.isRead,
    this.type,
    this.relatedItemId,
  });
}
