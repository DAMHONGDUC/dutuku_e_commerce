import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:system_design_flutter/index.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  const NotificationRepositoryImpl();

  @override
  Future<Either<Failure, NotificationData>> getNotificationData() async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    return Right(
      NotificationData(
        listNotification: NotificationsMock.generateMockNotifications(),
        listNotificationCategory: NotificationsMock.generateMockCategories(),
      ),
    );
  }
}
