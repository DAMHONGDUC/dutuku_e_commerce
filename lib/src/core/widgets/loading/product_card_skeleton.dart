import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorTheme.surfaceDefault,
        borderRadius: BorderRadius.circular(SdSpacing.s12),
        boxShadow: [
          BoxShadow(
            color: SdColors.black12,
            blurRadius: SdSpacing.s12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          SizedBox(
            height: kImageSize,
            child: SdSkeleton(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SdSpacing.s8),
                topRight: Radius.circular(SdSpacing.s8),
              ),
            ),
          ),
          SizedBox(height: SdSpacing.s10),

          Container(
            padding: EdgeInsets.all(SdSpacing.s8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name
                SdSkeleton(height: SdSpacing.s14, width: double.infinity),
                SizedBox(height: SdSpacing.s4),

                // band
                SdSkeleton(height: SdSpacing.s14, width: 120),
                SizedBox(height: SdSpacing.s8),

                // price
                SdSkeleton(height: SdSpacing.s12, width: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
