// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/repositories/banner_repository_impl.dart' as _i519;
import '../data/repositories/product_repository_impl.dart' as _i839;
import '../domain/domain.dart' as _i515;
import '../domain/repositories/banner_repository.dart' as _i455;
import '../domain/repositories/product_repository.dart' as _i747;
import '../domain/usecases/get_banners_usecase.dart' as _i638;
import '../domain/usecases/get_categories_usecase.dart' as _i350;
import '../domain/usecases/get_recommend_product_usecase.dart' as _i243;
import '../presentation/home/category_tab/list_category/list_category_controller.dart'
    as _i686;
import '../presentation/home/banner_carousel_section/banner_carousel_controller.dart'
    as _i692;
import '../presentation/home/product_grid_section/recommend_products_controller.dart'
    as _i684;
import '../presentation/tutorial/tutorial_controller.dart' as _i509;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i509.TutorialController>(() => _i509.TutorialController());
    gh.factory<_i515.ProductRepository>(
      () => const _i839.ProductRepositoryImpl(),
    );
    gh.factory<_i515.BannerRepository>(
      () => const _i519.BannerRepositoryImpl(),
    );
    gh.factory<_i243.GetRecommendProductUsecase>(
      () => _i243.GetRecommendProductUsecase(gh<_i747.ProductRepository>()),
    );
    gh.factory<_i350.GetCategoriesUsecase>(
      () => _i350.GetCategoriesUsecase(gh<_i515.ProductRepository>()),
    );
    gh.factory<_i638.GetBannersUsecase>(
      () => _i638.GetBannersUsecase(gh<_i455.BannerRepository>()),
    );
    gh.factory<_i686.ListCategoryController>(
      () => _i686.ListCategoryController(gh<_i515.GetCategoriesUsecase>()),
    );
    gh.factory<_i692.BannerCarouselController>(
      () => _i692.BannerCarouselController(gh<_i515.GetBannersUsecase>()),
    );
    gh.factory<_i684.RecommendProductsController>(
      () => _i684.RecommendProductsController(
        gh<_i515.GetRecommendProductUsecase>(),
      ),
    );
    return this;
  }
}
