import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/presentation/tutorial/tutorial_controller.dart';

class TutorialDi {
  static config() {
    getIt.registerFactory<TutorialController>(() => TutorialController());
  }
}
