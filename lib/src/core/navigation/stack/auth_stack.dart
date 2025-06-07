import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/login/login_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/login/otp/login_otp_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/register/otp/register_otp_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.login.fullPath,
      name: AppRoutes.login.name,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.loginOtp.fullPath,
      name: AppRoutes.loginOtp.name,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginOTPScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.register.fullPath,
      name: AppRoutes.register.name,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.registerOtp.fullPath,
      name: AppRoutes.registerOtp.name,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterOTPScreen();
      },
    ),
  ];
}
