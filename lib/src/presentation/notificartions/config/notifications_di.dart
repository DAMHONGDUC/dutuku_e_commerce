import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/usecases/get_notifications_usecase.dart';
import 'package:dutuku_e_commerce/src/presentation/notificartions/notifications_controller.dart';

class NotificationsDi {
  static config() {
    getIt.registerFactory<NotificationsController>(
      () => NotificationsController(getIt<GetNotificationsUsecase>()),
    );
  }
}
