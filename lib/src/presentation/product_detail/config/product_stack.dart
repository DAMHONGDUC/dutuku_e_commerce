import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/config/product_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/widgets/route/sd_go_route.dart';

import '../product_detail_args.dart';
import '../product_detail_screen.dart';

class ProductStack {
  static final List<GoRoute> routes = [
    SdGoRoute(
      path: ProductRoutes.productDetail.path,
      name: ProductRoutes.productDetail.name,
      parentNavigatorKey: kRootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        final args = state.extra as ProductDetailArgs;
        return ProductDetailScreen(args: args);
      },
    ),
  ];
}
