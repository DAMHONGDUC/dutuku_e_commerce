import 'package:dutuku_e_commerce/src/features/product/data/mapper/product_model_to_product_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/recommend_products_data_model.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/recommend_products_data.dart';

class RecommendProductsDataModelToRecommendProductsDataEntityMapper {
  const RecommendProductsDataModelToRecommendProductsDataEntityMapper._();

  static RecommendProductsData toEntity(RecommendProductsDataModel model) {
    return RecommendProductsData(
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
