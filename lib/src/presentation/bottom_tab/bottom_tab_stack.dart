import 'package:dutuku_e_commerce/src/core/navigation/router_config.dart';
import 'package:dutuku_e_commerce/src/presentation/home/config/home_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/my_order/config/my_order_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/notificartions/config/notifications_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/profile/config/profile_stack.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bottom_tab_base_screen.dart';

class BottomTabStack {
  static final statefulShellRoute = StatefulShellRoute.indexedStack(
    builder:
        (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return BottomTabBaseScreen(navigationShell: navigationShell);
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
  );
}
