import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/widgets/route/sd_go_route.dart';

import '../login_screen.dart';
import '../otp/login_otp_screen.dart';
import 'login_routes.dart';

class LoginStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: LoginRoutes.login.path,
      name: LoginRoutes.login.name,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: [
        SdGoRoute(
          path: LoginRoutes.loginOtp.path,
          name: LoginRoutes.loginOtp.name,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginOTPScreen();
          },
        ),
      ],
    ),
  ];
}
