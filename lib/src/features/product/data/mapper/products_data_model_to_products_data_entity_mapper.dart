import 'package:dutuku_e_commerce/src/features/product/data/mapper/product_model_to_product_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/product_data_model.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';

class ProductsDataModelToProductsDataEntityMapper {
  const ProductsDataModelToProductsDataEntityMapper._();

  static ProductsData toEntity(ProductsDataModel model) {
    return ProductsData(
      items:
          model.items
              ?.map((e) => ProductModelToProductEntityMapper.toEntity(e))
              .toList() ??
          [],
      totalPage: model.totalPage ?? 0,
      currentPage: model.currentPage ?? 0,
      totalRecord: model.totalRecord ?? 0,
    );
  }
}
