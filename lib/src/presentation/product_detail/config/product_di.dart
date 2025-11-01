import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/color_selection_section/color_selection_controller.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/product_detail_app_bar.dart/product_detail_app_bar_controller.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/product_detail_controller.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/related_product_section/related_products_controller.dart';

class ProductDi {
  static configureDependencies() {
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
  }
}
