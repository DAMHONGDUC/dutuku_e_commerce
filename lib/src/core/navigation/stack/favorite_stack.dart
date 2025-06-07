import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class FavoriteStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.favorite.fullPath,
      name: AppRoutes.favorite.name,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          SdTransitionPage.bottomTabFadeTransition(
            child: FavoriteScreen(),
            state: state,
          ),
      routes: <RouteBase>[],
    ),
  ];
}
