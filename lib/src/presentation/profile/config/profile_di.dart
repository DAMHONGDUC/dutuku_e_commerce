import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/presentation/profile/profile_controller.dart';

class ProfileDi {
  static configureDependencies() {
    getIt.registerFactory<ProfileController>(() => ProfileController());
  }
}
