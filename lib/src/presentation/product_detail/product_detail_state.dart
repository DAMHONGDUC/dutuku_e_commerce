part of 'product_detail_controller.dart';

sealed class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoadingState extends ProductDetailState {}

final class ProductDetailLoadedState extends ProductDetailState {
  final Product product;

  const ProductDetailLoadedState({required this.product});
}

final class ProductDetailErrorState extends ProductDetailState {
  final String errorMsg;

  const ProductDetailErrorState({required this.errorMsg});
}
