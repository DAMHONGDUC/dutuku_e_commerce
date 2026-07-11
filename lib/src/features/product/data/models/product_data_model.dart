import 'product_model.dart';

class ProductsDataModel {
  final List<ProductModel>? items;
  final int? totalPage;
  final int? currentPage;
  final int? totalRecord;

  const ProductsDataModel({
    this.items,
    this.totalPage,
    this.currentPage,
    this.totalRecord,
  });
}
