import 'package:dutuku_e_commerce/src/data/repositories/repositories.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

class RepositoriesDi {
  static configureDependencies() {
    getIt.registerLazySingleton<BannerRepository>(() => BannerRepositoryImpl());
    getIt.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl());
    getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(),
    );
  }
}
