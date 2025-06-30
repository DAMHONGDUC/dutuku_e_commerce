import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class CategoryCardSkeleton extends StatelessWidget {
  const CategoryCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UIConstants.categoriesCardWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SdSkeleton(
            height: UIConstants.categoriesImageHeight,
            width: UIConstants.categoriesImageWidth,
            borderRadiusValue: SdSpacing.s100,
          ),
          SdVerticalSpacing(),
          SdSkeleton(height: SdSpacing.s12, width: double.infinity),
        ],
      ),
    );
  }
}
