import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/presentation/splash/splash_controller.dart';

class SplashDi {
  static configureDependencies() {
    getIt.registerFactory<SplashController>(() => SplashController());
  }
}
