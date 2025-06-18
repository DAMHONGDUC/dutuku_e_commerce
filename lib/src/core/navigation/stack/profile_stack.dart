import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class ProfileStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: AppRoutes.profile.path,
      name: AppRoutes.profile.name,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
      routes: <RouteBase>[],
    ),
  ];
}
