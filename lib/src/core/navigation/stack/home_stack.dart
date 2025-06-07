import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class HomeStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.home.fullPath,
      name: AppRoutes.home.name,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          SdTransitionPage.bottomTabFadeTransition(
            child: HomeScreen(),
            state: state,
          ),
      routes: <RouteBase>[],
    ),
  ];
}
