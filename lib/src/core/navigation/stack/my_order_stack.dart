import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/my_order/my_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class MyOrderStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.myOrder.fullPath,
      name: AppRoutes.myOrder.name,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          SdTransitionPage.bottomTabFadeTransition(
            child: MyOrderScreen(),
            state: state,
          ),
      routes: <RouteBase>[],
    ),
  ];
}
