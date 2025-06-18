import 'package:dutuku_e_commerce/src/core/navigation/app_routes.dart';
import 'package:dutuku_e_commerce/src/presentation/my_order/my_order_detail/my_order_detail.dart';
import 'package:dutuku_e_commerce/src/presentation/my_order/my_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class MyOrderStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: AppRoutes.myOrder.path,
      name: AppRoutes.myOrder.name,
      builder: (BuildContext context, GoRouterState state) {
        return const MyOrderScreen();
      },
      routes: <RouteBase>[
        SdGoRoute(
          path: AppRoutes.myOrderDetail.path,
          name: AppRoutes.myOrderDetail.name,
          builder: (BuildContext context, GoRouterState state) {
            return const MyOrderDetailScreen();
          },
        ),
      ],
    ),
  ];
}
