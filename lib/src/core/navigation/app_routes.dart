import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

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

class AppRoutes {
  static const SdRouter splash = SdRouter(
    name: 'splash',
    path: '/splash',
    fullPath: '/splash',
  );

  static const SdRouter tutorial = SdRouter(
    name: 'tutorial',
    path: '/tutorial',
    fullPath: '/tutorial',
  );

  // Login stack
  static const SdRouter login = SdRouter(
    name: 'login',
    path: '/login',
    fullPath: '/login',
  );
  static final SdRouter loginOtp = SdRouter(
    name: 'login-otp',
    path: 'login-otp',
    fullPath: '${login.fullPath}/login-otp',
  );

  // Register stack
  static const SdRouter register = SdRouter(
    name: 'register',
    path: '/register',
    fullPath: '/register',
  );

  static final SdRouter registerOtp = SdRouter(
    name: 'register-otp',
    path: 'register-otp',
    fullPath: '${register.fullPath}/register-otp',
  );

  // Home stack
  static const SdRouter home = SdRouter(
    name: 'home',
    path: '/home',
    fullPath: '/home',
  );

  static final SdRouter search = SdRouter(
    name: 'search',
    path: 'search',
    fullPath: '${home.fullPath}/search',
  );

  // My order stack
  static const SdRouter myOrder = SdRouter(
    name: 'my-order',
    path: '/my-order',
    fullPath: '/my-order',
  );

  static final SdRouter myOrderDetail = SdRouter(
    name: 'my-order-detail',
    path: 'my-order-detail',
    fullPath: '${myOrder.fullPath}/my-order-detail',
  );

  // Favorite stack
  static const SdRouter notifications = SdRouter(
    name: 'notifications',
    path: '/notifications',
    fullPath: '/notifications',
  );

  // Profile stack
  static const SdRouter profile = SdRouter(
    name: 'profile',
    path: '/profile',
    fullPath: '/profile',
  );

  // Product stack
  static final SdRouter productDetail = SdRouter(
    name: 'product-detail',
    path: '/product-detail',
    fullPath: '/product-detail',
  );

  // Preview media
  static final SdRouter previewMedia = SdRouter(
    name: 'preview-media',
    path: '/preview-media',
    fullPath: '/preview-media',
  );
}
