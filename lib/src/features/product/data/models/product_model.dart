import 'package:dutuku_e_commerce/src/features/product/data/models/description_model.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/product_color_model.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/product_size_model.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/review_comment_model.dart';

class ProductModel {
  final String? id;
  final String? name;
  final String? brand;
  final double? price;
  final String? imageUrl;
  final int? purchaserCount;
  final double? averageRating;
  final List<ProductColorModel>? productColors;
  final List<ProductSizeModel>? productSizes;
  final DescriptionModel? description;
  final List<ReviewCommentModel>? reviewComments;

  const ProductModel({
    this.id,
    this.name,
    this.brand,
    this.price,
    this.imageUrl,
    this.purchaserCount,
    this.averageRating,
    this.productColors,
    this.productSizes,
    this.description,
    this.reviewComments,
  });
}
