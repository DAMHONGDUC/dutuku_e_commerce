import 'package:system_design_flutter/config/router/sd_router.dart';

class MyOrderRoutes {
  static const SdRouter myOrder = SdRouter(
    name: 'my-order',
    path: '/my-order',
    fullPath: '/my-order',
  );

  static final SdRouter myOrderDetail = SdRouter(
    name: 'my-order-detail',
    path: 'my-order-detail',
    fullPath: '${myOrder.fullPath}/my-order-detail',
  );
}
