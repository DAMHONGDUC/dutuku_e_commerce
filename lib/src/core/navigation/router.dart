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

// Define global keys for each branch's navigator if you need to access them programmatically
// This is good practice for clarity, though not strictly required by StatefulShellRoute for basic usage
final GlobalKey<NavigatorState> kHomeTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'homeTabNav');
final GlobalKey<NavigatorState> kMyOrderTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'myOrderTabNav');
final GlobalKey<NavigatorState> kFavoriteTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favoriteTabNav');
final GlobalKey<NavigatorState> kProfileTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profileTabNav');

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
    // Base Screen Tabs using StatefulShellRoute
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            // Pass the StatefulNavigationShell to BaseScreen so it can manage tabs
            return BaseScreen(navigationShell: navigationShell);
          },
      branches: <StatefulShellBranch>[
        // Home Tab Branch
        StatefulShellBranch(
          navigatorKey: kHomeTabNavigatorKey,
          routes: <RouteBase>[...HomeStack.routes],
        ),
        // My Order Tab Branch
        StatefulShellBranch(
          navigatorKey: kMyOrderTabNavigatorKey,
          routes: <RouteBase>[...MyOrderStack.routes],
        ),
        // Favorite Tab Branch
        StatefulShellBranch(
          navigatorKey: kFavoriteTabNavigatorKey,
          routes: <RouteBase>[...FavoriteStack.routes],
        ),
        // Profile Tab Branch
        StatefulShellBranch(
          navigatorKey: kProfileTabNavigatorKey,
          routes: <RouteBase>[...ProfileStack.routes],
        ),
      ],
    ),
  ],
);
