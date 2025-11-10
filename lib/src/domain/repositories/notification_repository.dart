import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<int>>> getNotifications();
}
