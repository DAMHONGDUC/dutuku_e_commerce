import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/models/notification_category_model.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/models/notification_model.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockNotificationRemoteDataSource dataSource;
  late NotificationRepositoryImpl repository;

  setUp(() {
    dataSource = MockNotificationRemoteDataSource();
    repository = NotificationRepositoryImpl(dataSource: dataSource);
  });

  final tNotificationModel = NotificationModel(
    id: '1',
    title: 'Title',
    body: 'Body',
    timestamp: DateTime(2026, 1, 1),
    isRead: false,
    type: NotificationType.general,
  );

  const tCategoryModel = NotificationCategoryModel(
    name: 'Promotions',
    description: 'Deals',
    type: NotificationCategoryType.promotion,
    numOfNotifications: 1,
  );

  test('should map data source models to a NotificationData entity', () async {
    when(
      () => dataSource.getNotifications(),
    ).thenAnswer((_) async => [tNotificationModel]);
    when(
      () => dataSource.getNotificationCategories(),
    ).thenAnswer((_) async => [tCategoryModel]);

    final result = await repository.getNotificationData();

    result.fold((_) => fail('expected Right'), (data) {
      expect(data.listNotification.single.id, '1');
      expect(data.listNotificationCategory.single.name, 'Promotions');
    });
  });

  test('should return a ServerFailure when the data source throws', () async {
    when(
      () => dataSource.getNotifications(),
    ).thenThrow(const ServerException());

    final result = await repository.getNotificationData();

    expect(result, Left(ServerFailure()));
  });
}
