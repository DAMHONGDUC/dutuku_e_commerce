part of 'product_detail_controller.dart';

sealed class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoadingState extends ProductDetailState {}

final class ProductDetailLoadedState extends ProductDetailState {}
