import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/my_order/my_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyOrderStack {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoutes.myOrder.fullPath,
      name: AppRoutes.myOrder.name,
      builder: (BuildContext context, GoRouterState state) {
        return const MyOrderScreen();
      },
      routes: <RouteBase>[],
    ),
  ];
}
