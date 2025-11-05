import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class ProductInfoSkeleton extends StatelessWidget {
  const ProductInfoSkeleton({super.key, required this.imgHeight});
  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SdSkeleton(height: imgHeight, borderRadius: BorderRadius.zero),
          Container(
            color: context.colorTheme.surfaceDefault,
            padding: EdgeInsets.all(SdSpacing.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // skeleton 1
                SdVerticalSpacing(),
                SdSkeleton(width: 300),
                SdVerticalSpacing(),
                SdSkeleton(width: 100),

                // skeleton 2
                SdVerticalSpacing(xRatio: 2),
                SdSkeleton(height: 80),

                // skeleton 3
                SdVerticalSpacing(xRatio: 2),
                SdSkeleton(),
                SdVerticalSpacing(),
                SdSkeleton(),
                SdVerticalSpacing(),
                SdSkeleton(),

                // skeleton 5
                SdVerticalSpacing(xRatio: 2),
                ProductGridSkeleton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
