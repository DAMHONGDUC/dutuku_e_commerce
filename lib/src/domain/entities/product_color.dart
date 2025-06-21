import 'package:equatable/equatable.dart';

class ProductColor extends Equatable {
  final String colorName;
  final String imageUrl;

  const ProductColor({required this.colorName, required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl, colorName];
}
