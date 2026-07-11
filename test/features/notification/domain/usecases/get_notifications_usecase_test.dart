import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/notification/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockNotificationRepository repository;
  late GetNotificationsUsecase usecase;

  setUp(() {
    repository = MockNotificationRepository();
    usecase = GetNotificationsUsecase(repository);
  });

  final tNotificationData = NotificationData(
    listNotification: const [],
    listNotificationCategory: const [],
  );

  test(
    'should return notification data from the repository on success',
    () async {
      when(
        () => repository.getNotificationData(),
      ).thenAnswer((_) async => Right(tNotificationData));

      final result = await usecase.call(NoParams());

      expect(result, Right(tNotificationData));
      verify(() => repository.getNotificationData()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test('should return a Failure when the repository fails', () async {
    final failure = ServerFailure();
    when(
      () => repository.getNotificationData(),
    ).thenAnswer((_) async => Left(failure));

    final result = await usecase.call(NoParams());

    expect(result, Left(failure));
  });
}
