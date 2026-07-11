import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/product/data/data_sources/product_remote_data_source_impl.dart';
import 'package:dutuku_e_commerce/src/features/product/data/repositories/product_repository_impl.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/product_detail/color_selection_section/color_selection_controller.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/product_detail/product_detail_app_bar/product_detail_app_bar_controller.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/product_detail/product_detail_controller.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/product_detail/related_product_section/related_products_controller.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/recommend_products_section/recommend_products_controller.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/search_screen/search_controller.dart';

class ProductDi {
  static config() {
    getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(),
    );

    getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(dataSource: getIt<ProductRemoteDataSource>()),
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
    getIt.registerLazySingleton<SearchProductsUsecase>(
      () => SearchProductsUsecase(getIt<ProductRepository>()),
    );

    getIt.registerFactory<ColorSelectionController>(
      () => ColorSelectionController(),
    );
    getIt.registerFactory<ProductDetailAppBarController>(
      () => ProductDetailAppBarController(),
    );
    getIt.registerFactory<RelatedProductsController>(
      () => RelatedProductsController(getIt<GetRelatedProductUsecase>()),
    );
    getIt.registerFactory<ProductDetailController>(
      () => ProductDetailController(getIt<GetProductDetailUsecase>()),
    );
    getIt.registerFactory<RecommendProductsController>(
      () => RecommendProductsController(getIt<GetRecommendProductUsecase>()),
    );
    getIt.registerFactory<SearchProductsController>(
      () => SearchProductsController(getIt<SearchProductsUsecase>()),
    );
  }
}
