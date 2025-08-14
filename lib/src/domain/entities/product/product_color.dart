import 'package:equatable/equatable.dart';

class ProductColor extends Equatable {
  final String colorName;
  final String imageUrl;
  final String colorCode;

  const ProductColor({
    required this.colorName,
    required this.imageUrl,
    required this.colorCode,
  });

  @override
  List<Object?> get props => [imageUrl, colorName, colorCode];
}
