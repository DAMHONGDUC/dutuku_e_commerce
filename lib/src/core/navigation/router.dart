import 'package:dutuku_e_commerce/src/core/navigation/stack/notifications_stack.dart';
import 'package:dutuku_e_commerce/src/core/navigation/stack/home_stack.dart';
import 'package:dutuku_e_commerce/src/core/navigation/stack/login_stack.dart';
import 'package:dutuku_e_commerce/src/core/navigation/stack/my_order_stack.dart';
import 'package:dutuku_e_commerce/src/core/navigation/stack/product_stack.dart';
import 'package:dutuku_e_commerce/src/core/navigation/stack/profile_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/base/base_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/splash/splash_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/tutorial/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

import 'app_routes.dart';
import 'stack/common_stack.dart';
import 'stack/register_stack.dart';

final GoRouter kAppRouter = GoRouter(
  observers: [],
  navigatorKey: kRootNavigatorKey,
  initialLocation: AppRoutes.splash.path,
  debugLogDiagnostics: true,
  routes: [
    SdGoRoute(
      path: AppRoutes.splash.path,
      name: AppRoutes.splash.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    SdGoRoute(
      path: AppRoutes.tutorial.path,
      name: AppRoutes.tutorial.name,
      builder: (BuildContext context, GoRouterState state) {
        return const TutorialScreen();
      },
    ),
    // Login stack
    ...LoginStack.routes,
    // Register stack
    ...RegisterStack.routes,
    // Product stack
    ...ProductStack.routes,
    // Common stack
    ...CommonStack.routes,
    // Bottom tab
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return BaseScreen(navigationShell: navigationShell);
          },
      branches: [
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
          routes: <RouteBase>[...NotificationsStack.routes],
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
