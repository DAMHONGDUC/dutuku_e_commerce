import 'package:dutuku_e_commerce/src/data/data.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/home/config/home_di.dart';
import 'package:dutuku_e_commerce/src/presentation/my_order/config/my_order_di.dart';
import 'package:dutuku_e_commerce/src/presentation/notificartions/config/notifications_di.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/config/product_di.dart';
import 'package:dutuku_e_commerce/src/presentation/profile/config/profile_di.dart';
import 'package:dutuku_e_commerce/src/presentation/splash/config/splash_di.dart';
import 'package:dutuku_e_commerce/src/presentation/tutorial/config/tutorial_di.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class Injector {
  static configureDependencies() {
    // repository
    RepositoriesDi.configureDependencies();

    // usecase
    UsecasesDi.configureDependencies();

    // =========Controller===========

    // home
    HomeDi.configureDependencies();

    // my order
    MyOrderDi.configureDependencies();

    // product
    ProductDi.configureDependencies();

    // splash
    SplashDi.configureDependencies();

    // tutorial
    TutorialDi.configureDependencies();

    // profile
    ProfileDi.configureDependencies();

    // notifications
    NotificationsDi.config();
  }
}
