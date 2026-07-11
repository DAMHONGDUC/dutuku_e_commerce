import 'package:dutuku_e_commerce/src/features/product/data/models/product_model.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/product_entity.dart';

import 'description_model_to_description_entity_mapper.dart';
import 'review_comment_model_to_review_comment_entity_mapper.dart';
import 'product_color_model_to_product_color_entity_mapper.dart';
import 'product_size_model_to_product_size_entity_mapper.dart';

class ProductModelToProductEntityMapper {
  const ProductModelToProductEntityMapper._();

  static ProductEntity toEntity(ProductModel model) {
    return ProductEntity(
      id: model.id ?? '',
      name: model.name ?? '',
      brand: model.brand ?? '',
      price: model.price ?? 0,
      imageUrl: model.imageUrl ?? '',
      purchaserCount: model.purchaserCount ?? 0,
      averageRating: model.averageRating ?? 0,
      productColors:
          model.productColors
              ?.map(ProductColorModelToProductColorEntityMapper.toEntity)
              .toList() ??
          [],
      productSizes:
          model.productSizes
              ?.map(ProductSizeModelToProductSizeEntityMapper.toEntity)
              .toList() ??
          [],
      description: model.description != null
          ? DescriptionModelToDescriptionEntityMapper.toEntity(
              model.description!,
            )
          : null,
      reviewComments:
          model.reviewComments
              ?.map(ReviewCommentModelToReviewCommentEntityMapper.toEntity)
              .toList() ??
          [],
    );
  }
}
