part of '../product_detail_screen.dart';

class ProductIntroduceSection extends StatelessWidget {
  final Product product;

  const ProductIntroduceSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SdSpacing.s16,
        vertical: SdSpacing.s12,
      ),
      color: context.colorTheme.surfaceDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(product.name, style: SdTextStyle.heading24()),
              Spacer(),
              Text(
                'sold ${product.purchaserCount}',
                style: SdTextStyle.body12().wSemiBold(),
              ),
            ],
          ),
          if (product.brand.isNotEmpty) ...[
            SdVerticalSpacing(xRatio: 0.5),
            Text(
              product.brand,
              style: SdTextStyle.body16().copyWith(
                color: context.colorTheme.textSubTitle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
