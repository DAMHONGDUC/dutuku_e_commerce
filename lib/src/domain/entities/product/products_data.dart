import 'package:equatable/equatable.dart';

import 'product_entity.dart';

class ProductsData extends Equatable {
  final List<ProductEntity> items;
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
