part of '../product_detail_screen.dart';

class ProductDetailAppBar extends StatelessWidget {
  final Product product;

  const ProductDetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _kImgHeight,
      pinned: true,
      floating: false,
      backgroundColor: context.colorTheme.surfaceDefault,
      surfaceTintColor: Colors.transparent,
      elevation: SdSpacing.s2,
      shadowColor: context.colorTheme.primaryShadowDefault,
      flexibleSpace: FlexibleSpaceBar(
        background: SdImage(imagePath: product.imageUrl),
      ),
      actions: [
        IconButton(
          icon: SdIcon(
            iconData: Icons.share,
            color: context.colorTheme.iconDefault,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SdIcon(
            iconData: Ionicons.cart,
            color: context.colorTheme.iconDefault,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SdIcon(
            iconData: Icons.more_vert,
            color: context.colorTheme.iconDefault,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
