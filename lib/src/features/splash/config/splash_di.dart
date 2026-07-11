import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/features/splash/splash_controller.dart';

class SplashDi {
  static config() {
    getIt.registerFactory<SplashController>(() => SplashController());
  }
}
