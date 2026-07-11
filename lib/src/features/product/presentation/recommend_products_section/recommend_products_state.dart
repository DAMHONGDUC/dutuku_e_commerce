part of 'recommend_products_controller.dart';

abstract class RecommendProductsState extends Equatable {
  const RecommendProductsState();

  @override
  List<Object> get props => [];
}

class RecommendProductsInitial extends RecommendProductsState {}

class RecommendProductsLoadingState extends RecommendProductsState {}

class RecommendProductsLoadingLoadMoreState extends RecommendProductsState {
  final List<ProductEntity> products;

  const RecommendProductsLoadingLoadMoreState({required this.products});

  @override
  List<Object> get props => [products];
}

class RecommendProductsLoadedState extends RecommendProductsState {
  final List<ProductEntity> products;
  final int currentPage;
  final bool canLoadMore;

  const RecommendProductsLoadedState({
    required this.products,
    required this.currentPage,
    required this.canLoadMore,
  });

  @override
  List<Object> get props => [products, currentPage, canLoadMore];
}

class RecommendProductsErrorState extends RecommendProductsState {
  final String errorMsg;

  const RecommendProductsErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
