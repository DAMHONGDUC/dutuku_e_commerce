import 'package:dutuku_e_commerce/src/features/product/data/models/product_color_model.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/product_color.dart';

class ProductColorModelToProductColorEntityMapper {
  const ProductColorModelToProductColorEntityMapper._();

  static ProductColor toEntity(ProductColorModel model) {
    return ProductColor(
      colorName: model.colorName ?? '',
      imageUrl: model.imageUrl ?? '',
      colorCode: model.colorCode ?? '',
    );
  }
}
