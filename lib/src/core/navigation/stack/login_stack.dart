import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/login/login_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/login/otp/login_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: [
        GoRoute(
          path: AppRoutes.loginOtp.path,
          name: AppRoutes.loginOtp.name,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginOTPScreen();
          },
        ),
      ],
    ),
  ];
}
