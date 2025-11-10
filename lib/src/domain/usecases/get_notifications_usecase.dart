import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

class GetNotificationsUsecase implements UseCase<NotificationData, NoParams> {
  final NotificationRepository repository;

  GetNotificationsUsecase(this.repository);

  @override
  Future<Either<Failure, NotificationData>> call(NoParams params) async {
    return await repository.getNotificationData();
  }
}
