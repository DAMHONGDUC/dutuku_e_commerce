import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/notificartions/notificartion_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class NotificationStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: AppRoutes.favorite.path,
      name: AppRoutes.favorite.name,
      builder: (BuildContext context, GoRouterState state) {
        return const NotificationScreen.NotificationsScreen();
      },
      routes: <RouteBase>[],
    ),
  ];
}
