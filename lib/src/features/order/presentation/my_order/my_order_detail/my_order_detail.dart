import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/order/presentation/widgets/title_content_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

import 'my_order_detail_args.dart';
import 'my_order_detail_controller.dart';

const _kImgThumbnailSize = 80.0;

class MyOrderDetailScreen extends StatelessWidget {
  const MyOrderDetailScreen({super.key, required this.args});
  final MyOrderDetailArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<MyOrderDetailController>()
            ..getOrderDetail(orderId: args.orderId),
      child: const _MyOrderDetailView(),
    );
  }
}

class _MyOrderDetailView extends StatelessWidget {
  const _MyOrderDetailView();

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.pageDefault,
      contentBgColor: context.colorTheme.pageDefault,
      appBar: AppBar(
        title: const Text('Order Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      child: BlocBuilder<MyOrderDetailController, MyOrderDetailState>(
        builder: (context, state) {
          if (state is MyOrderDetailLoadingState ||
              state is MyOrderDetailInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MyOrderDetailErrorState) {
            return EmptyView(message: state.errorMsg);
          } else if (state is MyOrderDetailLoadedState) {
            return _OrderDetailContent(order: state.order);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _OrderDetailContent extends StatelessWidget {
  const _OrderDetailContent({required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(SdSpacing.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SdTag(
                label: order.status.label,
                color: order.status.color,
                borderRadiusValue: SdSpacing.s8,
              ),
            ],
          ),
          SdVerticalSpacing(),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.productName, style: SdTextStyle.heading14()),
                    SdVerticalSpacing(xRatio: 0.5),
                    TitleContentRow(
                      title: 'Color',
                      content: order.productColor.colorName,
                    ),
                    SdVerticalSpacing(xRatio: 0.25),
                    TitleContentRow(
                      title: 'Size',
                      content: order.productSize.name,
                    ),
                    SdVerticalSpacing(xRatio: 0.25),
                    TitleContentRow(
                      title: 'Quantity',
                      content: order.quantity.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SdVerticalSpacing(value: SdSpacing.s24),
          const Divider(),
          SdVerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: SdTextStyle.heading14()),
              Text(
                SdCurrencyFormatHelper.formatPrice(order.totalPrice),
                style: SdTextStyle.heading14().wBold(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
