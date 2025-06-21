import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String brand;
  final double price;
  final String imageUrl;

  const Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, brand, price, imageUrl];
}
