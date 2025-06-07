import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/register/otp/register_otp_screen.dart';
import 'package:dutuku_e_commerce/src/presentation/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.register.path,
      name: AppRoutes.register.name,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
      routes: [
        GoRoute(
          path: AppRoutes.registerOtp.path,
          name: AppRoutes.registerOtp.name,
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterOTPScreen();
          },
        ),
      ],
    ),
  ];
}
