part of 'recommend_products_controller.dart';

abstract class RecommendProductsState extends Equatable {
  const RecommendProductsState();

  @override
  List<Object> get props => [];
}

class RecommendProductsInitial extends RecommendProductsState {}

class RecommendProductsLoadingState extends RecommendProductsState {}

class RecommendProductsLoadedState extends RecommendProductsState {
  final List<ProductEntity> products;

  const RecommendProductsLoadedState({required this.products});

  @override
  List<Object> get props => [products];
}

class RecommendProductsErrorState extends RecommendProductsState {
  final String errorMsg;

  const RecommendProductsErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
