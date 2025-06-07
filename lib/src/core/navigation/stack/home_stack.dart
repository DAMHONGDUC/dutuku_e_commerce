import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/home/home_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/home/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.search.path,
          name: AppRoutes.search.name,
          parentNavigatorKey: kRootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchScreen();
          },
        ),
      ],
    ),
  ];
}
