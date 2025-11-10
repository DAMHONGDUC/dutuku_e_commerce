import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/domain/usecases/get_notifications_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsController extends Cubit<NotificationsState> {
  NotificationsController(this._getNotificationsUsecase)
    : super(NotificationsInitial());

  final GetNotificationsUsecase _getNotificationsUsecase;

  Future getData() async {
    emit(NotificationsLoadingState());

    final result = await _getNotificationsUsecase.call(NoParams());

    result.fold(
      (l) {
        // TODO: handle error
      },
      (r) {
        emit(NotificationsLoadedState(notificationData: r));
      },
    );
  }
}
