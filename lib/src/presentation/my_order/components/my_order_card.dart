import 'package:dutuku_e_commerce/src/core/enums/order_status.dart';
import 'package:dutuku_e_commerce/src/core/resources/resources.dart';
import 'package:dutuku_e_commerce/src/core/widgets/misc/title_content_row.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

const _kImgThumbnailSize = 60.0;

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SdSpacing.s12),
      decoration: BoxDecoration(
        color: context.colorTheme.cardDefault,
        borderRadius: BorderRadius.all(Radius.circular(SdSpacing.s10)),
        border: Border.all(
          width: SdSpacing.s1,
          color: context.colorTheme.pageDefault,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SdImage(
                borderRadiusValue: SdSpacing.s6,
                imagePath: order.productThumbnailUrl,
                width: _kImgThumbnailSize,
                height: _kImgThumbnailSize,
              ),
              SdHorizontalSpacing(),
              Expanded(
                child: _InfoSection(
                  name: order.productName,
                  color: order.productColor.colorName,
                  quantity: order.quantity,
                ),
              ),
              SdHorizontalSpacing(),
              _PriceAndTagSection(
                price: order.totalPrice,
                status: order.status,
              ),
            ],
          ),
          SdVerticalSpacing(xRatio: 0.5),
          _ActionSection(),
        ],
      ),
    );
  }
}

class _PriceAndTagSection extends StatelessWidget {
  const _PriceAndTagSection({required this.price, required this.status});
  final double price;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SdTag(label: status.label),
        SdVerticalSpacing(),
        Text(
          SdCurrencyFormatHelper.formatPrice(price),
          style: SdTextStyle.heading14(),
        ),
      ],
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({
    required this.name,
    required this.color,
    required this.quantity,
  });
  final String name;
  final String color;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: SdTextStyle.heading14(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SdVerticalSpacing(xRatio: 0.5),
        TitleContentRow(title: 'Color', content: color),
        SdVerticalSpacing(xRatio: 0.25),
        TitleContentRow(title: 'Quantity', content: quantity.toString()),
      ],
    );
  }
}

class _ActionSection extends StatelessWidget {
  const _ActionSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SdButton(
          type: SdButtonType.secondary,
          title: 'Detail',
          colorConfig: Helper.getSdButtonColorConfig(context),
          borderRadiusValue: SdSpacing.s12,
          buttonSize: SdButtonSize.Small,
        ),
        SdHorizontalSpacing(),
        SdButton(
          title: 'Tracking',
          colorConfig: Helper.getSdButtonColorConfig(context),
          borderRadiusValue: SdSpacing.s12,
          buttonSize: SdButtonSize.Small,
        ),
      ],
    );
  }
}
