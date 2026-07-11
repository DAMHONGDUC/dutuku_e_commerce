part of 'search_controller.dart';

sealed class SearchProductsState extends Equatable {
  const SearchProductsState();

  @override
  List<Object> get props => [];
}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsLoadingState extends SearchProductsState {}

final class SearchProductsLoadedState extends SearchProductsState {
  final List<ProductEntity> products;

  const SearchProductsLoadedState({required this.products});

  @override
  List<Object> get props => [products];
}

final class SearchProductsErrorState extends SearchProductsState {
  final String errorMsg;

  const SearchProductsErrorState({required this.errorMsg});
}
