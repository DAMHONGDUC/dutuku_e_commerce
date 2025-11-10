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
