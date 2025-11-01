import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/home/banner_carousel_section/banner_carousel_controller.dart';
import 'package:dutuku_e_commerce/src/presentation/home/categories_section/categories_section_controller.dart';
import 'package:dutuku_e_commerce/src/presentation/home/recommend_products_section/recommend_products_controller.dart';

class HomeDi {
  static configureDependencies() {
    getIt.registerFactory<BannerCarouselController>(
      () => BannerCarouselController(getIt<GetBannersUsecase>()),
    );
    getIt.registerFactory<CategoriesController>(
      () => CategoriesController(getIt<GetCategoriesUsecase>()),
    );
    getIt.registerFactory<RecommendProductsController>(
      () => RecommendProductsController(getIt<GetRecommendProductUsecase>()),
    );
  }
}
