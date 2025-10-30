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
import '../data/repositories/order_repository_impl.dart' as _i979;
import '../data/repositories/product_repository_impl.dart' as _i839;
import '../domain/domain.dart' as _i515;
import '../domain/repositories/banner_repository.dart' as _i455;
import '../domain/repositories/product_repository.dart' as _i747;
import '../domain/usecases/get_banners_usecase.dart' as _i638;
import '../domain/usecases/get_categories_usecase.dart' as _i350;
import '../domain/usecases/get_my_order_usecase.dart' as _i620;
import '../domain/usecases/get_product_detail_usecase.dart' as _i365;
import '../domain/usecases/get_recommend_product_usecase.dart' as _i243;
import '../domain/usecases/get_related_product_usecase.dart' as _i760;
import '../presentation/home/banner_carousel_section/banner_carousel_controller.dart'
    as _i711;
import '../presentation/home/categories_section/categories_section_controller.dart'
    as _i5;
import '../presentation/home/recommend_products_section/recommend_products_controller.dart'
    as _i1056;
import '../presentation/my_order/my_order_controller.dart' as _i344;
import '../presentation/product_detail/color_selection_section/color_selection_controller.dart'
    as _i944;
import '../presentation/product_detail/product_detail_app_bar.dart/product_detail_app_bar_controller.dart'
    as _i933;
import '../presentation/product_detail/product_detail_controller.dart' as _i939;
import '../presentation/product_detail/related_product_section/related_products_controller.dart'
    as _i607;
import '../presentation/tutorial/tutorial_controller.dart' as _i509;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i509.TutorialController>(() => _i509.TutorialController());
    gh.factory<_i933.ProductDetailAppBarController>(
      () => _i933.ProductDetailAppBarController(),
    );
    gh.factory<_i944.ColorSelectionController>(
      () => _i944.ColorSelectionController(),
    );
    gh.factory<_i515.ProductRepository>(
      () => const _i839.ProductRepositoryImpl(),
    );
    gh.factory<_i515.BannerRepository>(
      () => const _i519.BannerRepositoryImpl(),
    );
    gh.factory<_i243.GetRecommendProductUsecase>(
      () => _i243.GetRecommendProductUsecase(gh<_i747.ProductRepository>()),
    );
    gh.factory<_i760.GetRelatedProductUsecase>(
      () => _i760.GetRelatedProductUsecase(gh<_i747.ProductRepository>()),
    );
    gh.factory<_i350.GetCategoriesUsecase>(
      () => _i350.GetCategoriesUsecase(gh<_i515.ProductRepository>()),
    );
    gh.factory<_i365.GetProductDetailUsecase>(
      () => _i365.GetProductDetailUsecase(gh<_i515.ProductRepository>()),
    );
    gh.factory<_i515.OrderRepository>(() => const _i979.OrderRepositoryImpl());
    gh.factory<_i638.GetBannersUsecase>(
      () => _i638.GetBannersUsecase(gh<_i455.BannerRepository>()),
    );
    gh.factory<_i5.CategoriesController>(
      () => _i5.CategoriesController(gh<_i515.GetCategoriesUsecase>()),
    );
    gh.factory<_i711.BannerCarouselController>(
      () => _i711.BannerCarouselController(gh<_i515.GetBannersUsecase>()),
    );
    gh.factory<_i607.RelatedProductsController>(
      () =>
          _i607.RelatedProductsController(gh<_i515.GetRelatedProductUsecase>()),
    );
    gh.factory<_i620.GetMyOrderUsecase>(
      () => _i620.GetMyOrderUsecase(gh<_i515.OrderRepository>()),
    );
    gh.factory<_i939.ProductDetailController>(
      () => _i939.ProductDetailController(gh<_i515.GetProductDetailUsecase>()),
    );
    gh.factory<_i344.ProductDetailController>(
      () => _i344.ProductDetailController(gh<_i620.GetMyOrderUsecase>()),
    );
    gh.factory<_i1056.RecommendProductsController>(
      () => _i1056.RecommendProductsController(
        gh<_i515.GetRecommendProductUsecase>(),
      ),
    );
    return this;
  }
}
