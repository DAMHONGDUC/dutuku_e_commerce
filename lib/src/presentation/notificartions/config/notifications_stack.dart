import 'package:dutuku_e_commerce/src/presentation/notificartions/notificartions_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

import 'notificartions_routes.dart';

class NotificationsStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: NotificartionsRoutes.notifications.path,
      name: NotificartionsRoutes.notifications.name,
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationScreen();
      },
      routes: <RouteBase>[],
    ),
  ];
}
