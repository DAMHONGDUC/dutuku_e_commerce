import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/home/home_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/home/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class HomeStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        SdGoRoute(
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
