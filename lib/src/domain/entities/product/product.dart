import 'package:dutuku_e_commerce/src/domain/entities/product/product_color.dart';
import 'package:equatable/equatable.dart';

import '../review_comment.dart';

class Product extends Equatable {
  final String name;
  final String brand;
  final double price;
  final String imageUrl;
  final List<ProductColor> productColors;
  final int id;
  final int purchaserCount;
  final String description;
  final List<ReviewComment> reviewComments;
  final double averageRating;

  const Product({
    this.productColors = const [],
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
    required this.id,
    required this.purchaserCount,
    required this.description,
    required this.reviewComments,
    required this.averageRating,
  });

  @override
  List<Object?> get props => [
    name,
    brand,
    price,
    imageUrl,
    productColors,
    id,
    purchaserCount,
    description,
    reviewComments,
    averageRating,
  ];
}
