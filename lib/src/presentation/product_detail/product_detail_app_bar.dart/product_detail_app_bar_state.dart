part of 'product_detail_app_bar_controller.dart';

sealed class ProductDetailAppBarState extends Equatable {
  const ProductDetailAppBarState({required this.scrollOffset});
  final double scrollOffset;

  @override
  List<Object> get props => [];
}

final class ProductDetailAppBarInitial extends ProductDetailAppBarState {
  const ProductDetailAppBarInitial({super.scrollOffset = 0});
}

final class ProductDetailScrollState extends ProductDetailAppBarState {
  const ProductDetailScrollState({required super.scrollOffset});
}

final class ProductDetailTransitState extends ProductDetailAppBarState {
  const ProductDetailTransitState({required super.scrollOffset});
}
