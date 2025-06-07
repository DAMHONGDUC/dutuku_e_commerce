import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.home.fullPath,
      name: AppRoutes.home.name,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[],
    ),
  ];
}
