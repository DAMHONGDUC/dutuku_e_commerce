import 'package:dutuku_e_commerce/src/domain/entities/product_color.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String brand;
  final double price;
  final String imageUrl;
  final List<ProductColor> productColors;
  final int id;

  const Product({
    this.productColors = const [],
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
    required this.id,
  });

  @override
  List<Object?> get props => [name, brand, price, imageUrl, productColors, id];
}
