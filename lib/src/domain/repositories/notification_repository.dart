import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/notification/notification_data.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationData>> getNotificationData();
}
