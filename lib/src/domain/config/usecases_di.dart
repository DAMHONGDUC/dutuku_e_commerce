import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/repositories/repositories.dart';
import 'package:dutuku_e_commerce/src/domain/usecases/get_notifications_usecase.dart';
import 'package:dutuku_e_commerce/src/domain/usecases/get_profile_settings_usecase.dart';
import 'package:dutuku_e_commerce/src/domain/usecases/usecases.dart';

class UsecasesDi {
  static config() {
    getIt.registerLazySingleton<GetBannersUsecase>(
      () => GetBannersUsecase(getIt<BannerRepository>()),
    );
    getIt.registerLazySingleton<GetCategoriesUsecase>(
      () => GetCategoriesUsecase(getIt<ProductRepository>()),
    );
    getIt.registerLazySingleton<GetMyOrderUsecase>(
      () => GetMyOrderUsecase(getIt<OrderRepository>()),
    );
    getIt.registerLazySingleton<GetProductDetailUsecase>(
      () => GetProductDetailUsecase(getIt<ProductRepository>()),
    );
    getIt.registerLazySingleton<GetRecommendProductUsecase>(
      () => GetRecommendProductUsecase(getIt<ProductRepository>()),
    );
    getIt.registerLazySingleton<GetRelatedProductUsecase>(
      () => GetRelatedProductUsecase(getIt<ProductRepository>()),
    );
    getIt.registerLazySingleton<GetProfileSettingsUsecase>(
      () => GetProfileSettingsUsecase(getIt<ProfileRepository>()),
    );
    getIt.registerLazySingleton<GetNotificationsUsecase>(
      () => GetNotificationsUsecase(getIt<NotificationRepository>()),
    );
  }
}
