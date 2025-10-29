import 'package:dutuku_e_commerce/src/presentation/bottom_tab/bottom_tab_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/login/router/login_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/router/product_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/register/router/register_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/splash/router/splash_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/splash/router/splash_stack.dart';
import 'package:dutuku_e_commerce/src/presentation/tutorial/router/tutorial_stack.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> kRootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

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
  initialLocation: SplashRoutes.splash.path,
  debugLogDiagnostics: true,
  routes: [
    ...SplashStack.routes,
    ...TutorialStack.routes,
    ...LoginStack.routes,
    ...RegisterStack.routes,
    ...ProductStack.routes,
    BottomTabStack.statefulShellRoute,
  ],
);
