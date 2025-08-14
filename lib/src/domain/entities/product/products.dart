import 'package:equatable/equatable.dart';

import 'product.dart';

class Products extends Equatable {
  final List<Product> products;
  final int totalPage;
  final int currentPage;
  final int totalRecord;

  const Products({
    required this.products,
    required this.totalPage,
    required this.currentPage,
    required this.totalRecord,
  });

  @override
  List<Object?> get props => [products, totalPage, currentPage, totalRecord];
}
