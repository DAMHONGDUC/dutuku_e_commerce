import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';

class RecommendProductsData extends ProductsData {
  const RecommendProductsData({
    required super.items,
    required super.totalPage,
    required super.currentPage,
    required super.totalRecord,
  });
}
