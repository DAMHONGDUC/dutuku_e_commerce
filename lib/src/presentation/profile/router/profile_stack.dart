import 'package:dutuku_e_commerce/src/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

import 'profile_routes.dart';

class ProfileStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: ProfileRoutes.profile.path,
      name: ProfileRoutes.profile.name,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
      routes: <RouteBase>[],
    ),
  ];
}
