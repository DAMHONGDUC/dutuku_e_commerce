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
  static config() {
    // repository
    RepositoriesDi.config();

    // usecase
    UsecasesDi.config();

    // =========Controller===========

    // home
    HomeDi.config();

    // my order
    MyOrderDi.config();

    // product
    ProductDi.config();

    // splash
    SplashDi.config();

    // tutorial
    TutorialDi.config();

    // profile
    ProfileDi.config();

    // notifications
    NotificationsDi.config();
  }
}
