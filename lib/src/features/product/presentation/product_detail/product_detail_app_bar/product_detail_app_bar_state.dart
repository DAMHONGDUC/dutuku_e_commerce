part of 'product_detail_app_bar_controller.dart';

sealed class ProductDetailAppBarState extends Equatable {
  const ProductDetailAppBarState({required this.scrollOffset});
  final double scrollOffset;

  @override
  List<Object> get props => [];

  double calculateProgress({required double imgHeight}) =>
      (scrollOffset / (imgHeight - kToolbarHeight)).clamp(0.0, 1.0);

  Color calculateIconBgColor({
    required BuildContext context,
    required double imgHeight,
  }) {
    return Color.lerp(
      Colors.black.withAlpha(80),
      context.colorTheme.surfaceDefault,
      calculateProgress(imgHeight: imgHeight),
    )!;
  }

  Color calculateIconColor({
    required BuildContext context,
    required double imgHeight,
  }) {
    return Color.lerp(
      Colors.white,
      context.colorTheme.primary,
      calculateProgress(imgHeight: imgHeight),
    )!;
  }
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
