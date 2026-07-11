part of 'notifications_controller.dart';

sealed class NotificationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoadingState extends NotificationsState {}

class NotificationsLoadedState extends NotificationsState {
  final NotificationData notificationData;

  NotificationsLoadedState({required this.notificationData});

  @override
  List<Object?> get props => [notificationData];
}

class NotificationsErrorState extends NotificationsState {
  final String errorMsg;

  NotificationsErrorState({required this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
