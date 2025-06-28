import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/notificartions/notificartions_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class NotificationsStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: AppRoutes.notifications.path,
      name: AppRoutes.notifications.name,
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationScreen.NotificationsScreen();
      },
      routes: <RouteBase>[],
    ),
  ];
}
