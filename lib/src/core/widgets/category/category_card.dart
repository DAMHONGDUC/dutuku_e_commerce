import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UIConstants.categoriesCardWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SdImage(
            imagePath: category.imageUrl,
            width: UIConstants.categoriesImageWidth,
            height: UIConstants.categoriesImageHeight,
            borderRadiusValue: SdSpacing.s100,
          ),
          SdVerticalSpacing(xRatio: 0.5),
          Text(
            category.name,
            style: context.textTheme.heading14,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
