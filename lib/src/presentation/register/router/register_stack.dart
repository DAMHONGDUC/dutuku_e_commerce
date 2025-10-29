import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/widgets/route/sd_go_route.dart';

import '../otp/register_otp_screen.dart';
import '../register_screen.dart';
import 'register_routes.dart';

class RegisterStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: RegisterRoutes.register.path,
      name: RegisterRoutes.register.name,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
      routes: [
        SdGoRoute(
          path: RegisterRoutes.registerOtp.path,
          name: RegisterRoutes.registerOtp.name,
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterOTPScreen();
          },
        ),
      ],
    ),
  ];
}
