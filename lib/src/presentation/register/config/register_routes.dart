import 'package:system_design_flutter/config/router/sd_router.dart';

class RegisterRoutes {
  static const SdRouter register = SdRouter(
    name: 'register',
    path: '/register',
    fullPath: '/register',
  );

  static final SdRouter registerOtp = SdRouter(
    name: 'register-otp',
    path: 'register-otp',
    fullPath: '${register.fullPath}/register-otp',
  );
}
