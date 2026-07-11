import 'package:dutuku_e_commerce/src/features/notification/presentation/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

import 'notifications_routes.dart';

class NotificationsStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: NotificationsRoutes.notifications.path,
      name: NotificationsRoutes.notifications.name,
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationScreen();
      },
      routes: <RouteBase>[],
    ),
  ];
}
