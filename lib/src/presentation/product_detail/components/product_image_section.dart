part of '../product_detail_screen.dart';

class ProductImageSection extends StatelessWidget {
  final Product product;

  const ProductImageSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _kImgHeight,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: SdImage(imagePath: product.imageUrl),
      ),
    );
  }
}
