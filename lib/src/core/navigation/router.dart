import 'package:dutuku_e_commerce/src/core/navigation/stack/favorite_stack.dart';
import 'package:dutuku_e_commerce/src/core/navigation/stack/home_stack.dart';
import 'package:dutuku_e_commerce/src/core/navigation/stack/my_order_stack.dart';
import 'package:dutuku_e_commerce/src/core/navigation/stack/profile_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/base/base_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/splash/splash_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/tutorial/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'stack/auth_stack.dart';

final GlobalKey<NavigatorState> kRootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter kAppRouter = GoRouter(
  observers: [],
  navigatorKey: kRootNavigatorKey,
  initialLocation: AppRoutes.splash.fullPath,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.splash.fullPath,
      name: AppRoutes.splash.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.tutorial.fullPath,
      name: AppRoutes.tutorial.name,
      builder: (BuildContext context, GoRouterState state) {
        return const TutorialScreen();
      },
    ),
    // Auth stack
    ...AuthStack.routes,
    // Base Screen Tabs
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BaseScreen(child: child);
      },
      routes: <RouteBase>[
        ...HomeStack.routes,
        ...MyOrderStack.routes,
        ...FavoriteStack.routes,
        ...ProfileStack.routes,
      ],
    ),
  ],
);
