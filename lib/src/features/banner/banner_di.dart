import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/features/banner/data/data_sources/banner_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/banner/data/repositories/banner_repository_impl.dart';
import 'package:dutuku_e_commerce/src/features/banner/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/banner/presentation/banner_carousel_section/banner_carousel_controller.dart';

class BannerDi {
  static config() {
    getIt.registerLazySingleton<BannerRemoteDataSource>(
      () => BannerRemoteDataSourceImpl(),
    );

    getIt.registerLazySingleton<BannerRepository>(
      () => BannerRepositoryImpl(dataSource: getIt<BannerRemoteDataSource>()),
    );

    getIt.registerLazySingleton<GetBannersUsecase>(
      () => GetBannersUsecase(getIt<BannerRepository>()),
    );

    getIt.registerFactory<BannerCarouselController>(
      () => BannerCarouselController(getIt<GetBannersUsecase>()),
    );
  }
}
