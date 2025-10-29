import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/home/home_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/home/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

import 'home_routes.dart';

class HomeStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: HomeRoutes.home.path,
      name: HomeRoutes.home.name,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        SdGoRoute(
          path: HomeRoutes.search.path,
          name: HomeRoutes.search.name,
          parentNavigatorKey: kRootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchScreen();
          },
        ),
      ],
    ),
  ];
}
