import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/data_sources/notification_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:dutuku_e_commerce/src/features/notification/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/notification/presentation/notifications/notifications_controller.dart';

class NotificationDi {
  static config() {
    getIt.registerLazySingleton<NotificationRemoteDataSource>(
      () => NotificationRemoteDataSourceImpl(),
    );

    getIt.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(
        dataSource: getIt<NotificationRemoteDataSource>(),
      ),
    );

    getIt.registerLazySingleton<GetNotificationsUsecase>(
      () => GetNotificationsUsecase(getIt<NotificationRepository>()),
    );

    getIt.registerFactory<NotificationsController>(
      () => NotificationsController(getIt<GetNotificationsUsecase>()),
    );
  }
}
