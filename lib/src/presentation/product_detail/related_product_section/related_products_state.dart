part of 'related_products_controller.dart';

abstract class RelatedProductsState extends Equatable {
  const RelatedProductsState();

  @override
  List<Object> get props => [];
}

class RelatedProductsInitial extends RelatedProductsState {}

class RelatedProductsLoadingState extends RelatedProductsState {}

class RelatedProductsLoadedState extends RelatedProductsState {
  final List<Product> products;

  const RelatedProductsLoadedState({required this.products});

  @override
  List<Object> get props => [products];
}

class RelatedProductsErrorState extends RelatedProductsState {
  final String errorMsg;

  const RelatedProductsErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
