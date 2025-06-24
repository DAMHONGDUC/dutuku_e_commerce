import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/index.dart';

final kImageHeight = 120.sp;

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorTheme.pageDefault,
      child: ListView.separated(
        padding: EdgeInsets.all(SdSpacing.s12),
        itemCount: MockData.categories.length,
        separatorBuilder: (_, __) => SdVerticalSpacing(),
        itemBuilder: (context, index) {
          final category = MockData.categories[index];
          return _CategoryCard(category: category, isEven: index % 2 == 0);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;
  final bool isEven;

  const _CategoryCard({required this.category, required this.isEven});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SdSpacing.s12),
        boxShadow: [
          BoxShadow(
            color: context.colorTheme.boxShadowDefault,
            blurRadius: SdSpacing.s12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SdSpacing.s12),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              category.imageUrl,
              width: double.infinity,
              height: kImageHeight,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SdSpacing.s20),
              child: Row(
                children: isEven
                    ? [
                        _Content(
                          name: category.name,
                          numOfProduct: category.numOfProduct,
                          alignment: CrossAxisAlignment.start,
                        ),
                        const Spacer(),
                      ]
                    : [
                        const Spacer(),
                        _Content(
                          name: category.name,
                          numOfProduct: category.numOfProduct,
                          alignment: CrossAxisAlignment.end,
                        ),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String name;
  final int numOfProduct;
  final CrossAxisAlignment alignment;

  const _Content({
    required this.name,
    required this.numOfProduct,
    this.alignment = CrossAxisAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name, style: context.textTheme.heading14),
        SdVerticalSpacing(xRatio: 0.25),
        Text('$numOfProduct Product', style: context.textTheme.body12),
      ],
    );
  }
}
