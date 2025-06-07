import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.profile.fullPath,
      name: AppRoutes.profile.name,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
    ),
  ];
}
