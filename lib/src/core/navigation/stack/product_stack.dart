import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/product_detail_args.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

class ProductStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: AppRoutes.productDetail.path,
      name: AppRoutes.productDetail.name,
      parentNavigatorKey: kRootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        final args = state.extra as ProductDetailArgs;
        return ProductDetailScreen(args: args);
      },
    ),
  ];
}
