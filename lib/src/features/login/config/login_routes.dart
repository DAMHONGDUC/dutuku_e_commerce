import 'package:system_design_flutter/config/router/sd_router.dart';

class LoginRoutes {
  static const SdRouter login = SdRouter(
    name: 'login',
    path: '/login',
    fullPath: '/login',
  );
  static final SdRouter loginOtp = SdRouter(
    name: 'login-otp',
    path: 'login-otp',
    fullPath: '${login.fullPath}/login-otp',
  );
}
