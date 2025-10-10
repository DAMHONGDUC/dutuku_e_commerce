part of '../product_detail_screen.dart';

class BottomActionSection extends StatelessWidget {
  final double price;
  final VoidCallback? onAddToCart;

  const BottomActionSection({super.key, required this.price, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SdHelper.getPageDefaultPadding().copyWith(bottom: 0),
      decoration: BoxDecoration(
        color: context.colorTheme.surfaceDefault,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SdSpacing.s24),
          topRight: Radius.circular(SdSpacing.s24),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorTheme.boxShadowSecondary,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Price section
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: SdTextStyle.body14().wColor(
                    context.colorTheme.textSubTitle,
                  ),
                ),
                Text(
                  SdCurrencyFormatHelper.formatPrice(price),
                  style: SdTextStyle.body24()
                      .wColor(context.colorTheme.primary)
                      .wBold(),
                ),
              ],
            ),
            SdHorizontalSpacing(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SdButton(
                      text: 'Add to cart',
                      widthType: SdButtonWidth.full,
                      onTap: () {},
                      type: SdButtonType.secondary,
                      colorConfig: SdButtonColorConfig.init().copyWith(
                        secondaryBorderColor: context.colorTheme.primary,
                        secondaryTextColor: context.colorTheme.primary,
                      ),
                    ),
                  ),
                  SdHorizontalSpacing(),
                  Expanded(
                    child: SdButton(
                      text: 'Buy now',
                      widthType: SdButtonWidth.full,
                      colorConfig: SdButtonColorConfig.init().copyWith(
                        primaryBgColor: context.colorTheme.primary,
                      ),
                      onTap: () {},
                    ),
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
