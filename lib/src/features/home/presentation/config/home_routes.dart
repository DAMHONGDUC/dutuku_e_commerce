import 'package:system_design_flutter/config/router/sd_router.dart';

class HomeRoutes {
  static const SdRouter home = SdRouter(
    name: 'home',
    path: '/home',
    fullPath: '/home',
  );

  static final SdRouter search = SdRouter(
    name: 'search',
    path: 'search',
    fullPath: '${home.fullPath}/search',
  );
}
