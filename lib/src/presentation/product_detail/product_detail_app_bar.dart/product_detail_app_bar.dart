import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/color_selection_section/color_selection_controller.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';

import 'product_detail_app_bar_controller.dart';

class ProductDetailAppBar extends StatelessWidget {
  final Product product;
  final double imgHeight;

  const ProductDetailAppBar({
    super.key,
    required this.product,
    required this.imgHeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailAppBarController, ProductDetailAppBarState>(
      buildWhen: (previous, current) {
        return previous.scrollOffset != current.scrollOffset;
      },
      builder: (context, state) {
        double t = (state.scrollOffset / (imgHeight - kToolbarHeight)).clamp(
          0.0,
          1.0,
        );

        final Color iconBgColor = Color.lerp(
          Colors.black.withAlpha(80),
          context.colorTheme.surfaceDefault,
          t,
        )!;

        final Color iconColor = Color.lerp(
          Colors.white,
          context.colorTheme.primary,
          t,
        )!;

        return SliverAppBar(
          expandedHeight: imgHeight,
          pinned: true,
          floating: false,
          backgroundColor: context.colorTheme.surfaceDefault,
          surfaceTintColor: Colors.transparent,
          elevation: SdSpacing.s2,
          shadowColor: context.colorTheme.primaryShadowDefault,
          flexibleSpace:
              BlocBuilder<ColorSelectionController, ColorSelectionState>(
                buildWhen: (previous, current) {
                  return current is ColorSelectionChangedColorState;
                },
                builder: (context, state) {
                  String imagePath = product.imageUrl;

                  if (state is ColorSelectionChangedColorState) {
                    imagePath = state.productColor.imageUrl;
                  }

                  return FlexibleSpaceBar(
                    background: SdImage(imagePath: imagePath),
                  );
                },
              ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            children: [
              SdFadingIcon(
                iconData: SdHelper.getAppBarBackIcon(),
                iconColor: iconColor,
                bgColor: iconBgColor,
                iconSize: SdSpacing.s24,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SdHorizontalSpacing(),
              Expanded(
                child: SdFadeWrapper(
                  progress: t,
                  child: SearchBar(
                    bgColor: context.colorTheme.cardOnSurface,
                    hasBorder: false,
                    searchIconSize: SdSpacing.s20,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            SdFadingIcon(
              iconData: Icons.share,
              iconColor: iconColor,
              bgColor: iconBgColor,
              iconSize: SdSpacing.s22,
              onTap: () {},
            ),
            SdFadingIcon(
              iconData: Ionicons.cart,
              iconColor: iconColor,
              bgColor: iconBgColor,
              iconSize: SdSpacing.s22,
              onTap: () {},
            ),
            SdFadingIcon(
              iconData: Icons.more_vert,
              iconColor: iconColor,
              bgColor: iconBgColor,
              iconSize: SdSpacing.s22,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
