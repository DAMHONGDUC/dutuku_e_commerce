import 'package:system_design_flutter/index.dart';

class AppRoutes {
  // Splash
  static const SdRouter splash = SdRouter(
    name: 'splash',
    path: 'splash',
    fullPath: '/splash',
  );

  // Tutorial
  static const SdRouter tutorial = SdRouter(
    name: 'tutorial',
    path: 'tutorial',
    fullPath: '/tutorial',
  );

  // Auth Stack
  static const SdRouter login = SdRouter(
    name: 'login',
    path: 'login',
    fullPath: '/auth/login',
  );
  static const SdRouter register = SdRouter(
    name: 'register',
    path: 'register',
    fullPath: '/auth/register',
  );
  static const SdRouter loginOtp = SdRouter(
    name: 'loginOtp',
    path: 'loginOtp',
    fullPath: '/auth/login/otp',
  );
  static const SdRouter registerOtp = SdRouter(
    name: 'registerOtp',
    path: 'registerOtp',
    fullPath: '/auth/register/otp',
  );

  // Base Screen Tabs
  static const SdRouter home = SdRouter(
    name: 'home',
    path: 'home',
    fullPath: '/base/home',
  );

  static const SdRouter myOrder = SdRouter(
    name: 'myOrder',
    path: 'my-order',
    fullPath: '/base/my-order',
  );
  static const SdRouter favorite = SdRouter(
    name: 'favorite',
    path: 'favorite',
    fullPath: '/base/favorite',
  );
  static const SdRouter profile = SdRouter(
    name: 'profile',
    path: 'profile',
    fullPath: '/base/profile',
  );
}
