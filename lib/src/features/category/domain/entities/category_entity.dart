import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final int numOfProduct;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.numOfProduct,
  });

  @override
  List<Object> get props => [id, name, imageUrl, numOfProduct];
}
