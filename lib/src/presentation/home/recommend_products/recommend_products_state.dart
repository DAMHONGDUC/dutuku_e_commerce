part of 'recommend_products_controller.dart';

abstract class RecommendProductsState {}

class RecommendProductsLoading extends RecommendProductsState {}

class RecommendProductsLoaded extends RecommendProductsState {
  final List<Product> products;

  RecommendProductsLoaded(this.products);
}

class RecommendProductsError extends RecommendProductsState {
  final String message;

  RecommendProductsError(this.message);
}
