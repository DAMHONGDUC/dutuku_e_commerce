import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/login/login_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/login/otp/login_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class LoginStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: [
        SdGoRoute(
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
