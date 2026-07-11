import 'package:dutuku_e_commerce/src/features/product/data/models/product_size_model.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/product_size.dart';

class ProductSizeModelToProductSizeEntityMapper {
  const ProductSizeModelToProductSizeEntityMapper._();

  static ProductSize toEntity(ProductSizeModel model) {
    return ProductSize(id: model.id ?? '', name: model.name ?? '');
  }
}
