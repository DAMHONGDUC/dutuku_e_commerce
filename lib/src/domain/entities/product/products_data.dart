import 'package:equatable/equatable.dart';

import 'product.dart';

class ProductsData extends Equatable {
  final List<Product> items;
  final int totalPage;
  final int currentPage;
  final int totalRecord;

  const ProductsData({
    required this.items,
    required this.totalPage,
    required this.currentPage,
    required this.totalRecord,
  });

  @override
  List<Object?> get props => [items, totalPage, currentPage, totalRecord];
}
