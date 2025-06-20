part of 'product_grid_controller.dart';

abstract class ProductGridState {}

class ProductGridLoading extends ProductGridState {}

class ProductGridLoaded extends ProductGridState {
  final List<Product> products;

  ProductGridLoaded(this.products);
}

class ProductGridError extends ProductGridState {
  final String message;

  ProductGridError(this.message);
}
