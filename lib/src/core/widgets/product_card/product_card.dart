import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/index.dart';

final kImageSize = 150.sp;

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.pageDefault,
        borderRadius: BorderRadius.circular(SdSpacing.s12),
        boxShadow: [
          BoxShadow(
            color: context.colorTheme.boxShadowDefault,
            blurRadius: SdSpacing.s12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          SizedBox(
            height: kImageSize,
            child: _CardImageView(imageUrl: product.imageUrl),
          ),
          SizedBox(height: SdSpacing.s8),

          Container(
            padding: EdgeInsets.all(SdSpacing.s8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name
                Text(product.name, style: context.textTheme.body12),
                SizedBox(height: SdSpacing.s2),

                // brand
                Text(
                  product.brand,
                  style: context.textTheme.body10.wColor(
                    context.colorTheme.textSubTitle,
                  ),
                ),
                SizedBox(height: SdSpacing.s6),

                // price
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: context.textTheme.heading14.wBold(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardImageView extends StatelessWidget {
  const _CardImageView({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SdSpacing.s8),
              topRight: Radius.circular(SdSpacing.s8),
            ),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color: SdColors.grey900,
              borderRadius: BorderRadius.all(Radius.circular(SdSpacing.s100)),
            ),
            child: Padding(
              padding: EdgeInsets.all(SdSpacing.s6),
              child: SdIcon(
                iconData: Icons.favorite_border,
                color: AppColors.white,
                iconSize: SdSpacing.s16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
