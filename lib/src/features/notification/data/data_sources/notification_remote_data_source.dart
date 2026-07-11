import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/mock/notifications_mock.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/models/notification_category_model.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/models/notification_model.dart';
import 'package:system_design_flutter/index.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<List<NotificationCategoryModel>> getNotificationCategories();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  const NotificationRemoteDataSourceImpl();

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      await SdHelper.delayLoading();
      return NotificationsMock.generateMockNotifications();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<NotificationCategoryModel>> getNotificationCategories() async {
    try {
      await SdHelper.delayLoading();
      return NotificationsMock.generateMockCategories();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
