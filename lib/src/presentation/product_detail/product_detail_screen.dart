import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

import 'color_selection_section/color_selection_section.dart';
import 'product_detail_args.dart';
import 'product_detail_controller.dart';

part 'components/bottom_action_section.dart';
part 'components/description_section.dart';
part 'components/product_image_section.dart';
part 'components/product_info_section.dart';

final _kImgHeight = 400.0;

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailArgs args;

  const ProductDetailScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<ProductDetailController>()
                ..getProductDetail(productId: args.productId),
        ),
      ],
      child: _ProductDetailView(args: args),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView({required this.args});
  final ProductDetailArgs args;

  Future _onRefresh(BuildContext context) async {
    context.read<ProductDetailController>().getProductDetail(
      productId: args.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.surfaceDefault,
      bottomNavigationBar:
          BlocBuilder<ProductDetailController, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailLoadedState) {
                return BottomActionSection(price: 1);
              }
              return SizedBox.shrink();
            },
          ),
      child: RefreshWrapper(
        onRefresh: () => _onRefresh(context),
        child: BlocConsumer<ProductDetailController, ProductDetailState>(
          listener: (context, state) {
            // TODO: implement listener id needed
          },
          builder: (context, state) {
            if (state is ProductDetailLoadingState) {
              return _ProductInfoSkeleton();
            } else if (state is ProductDetailLoadedState) {
              return _ProductInfoView(product: state.product);
            } else if (state is ProductDetailErrorState) {
              // TODO: add error UI
              return SizedBox.shrink();
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _ProductInfoView extends StatelessWidget {
  const _ProductInfoView({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App Bar
        ProductImageSection(product: product),

        // Product Info Section
        SliverToBoxAdapter(
          child: ProductInfoSection(
            product: product,
            quantity: 1,
            onQuantityChanged: (a) {},
          ),
        ),

        SliverToBoxAdapter(child: Divider()),

        // Color Selection Section
        if (product.productColors.isNotEmpty)
          SliverToBoxAdapter(
            child: ColorSelectionSection(
              productColors: product.productColors,
              selectedIndex: 1,
              onColorSelected: (a) {},
              hexToColor: (a) {
                return Colors.black;
              },
            ),
          ),

        // Description Section
        SliverToBoxAdapter(
          child: const DescriptionSection(
            description:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a'
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a'
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a'
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a',
          ),
        ),

        // // Bottom Action Section
        // BottomActionSection(price: currentProduct.price),
      ],
    );
  }
}

class _ProductInfoSkeleton extends StatelessWidget {
  const _ProductInfoSkeleton();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SdSkeleton(height: _kImgHeight, borderRadius: BorderRadius.zero),
          Container(
            color: context.colorTheme.surfaceDefault,
            padding: EdgeInsets.all(SdSpacing.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // skeleton 1
                SdVerticalSpacing(),
                SdSkeleton(height: 20, width: 300),
                SdVerticalSpacing(),
                SdSkeleton(height: 20, width: 100),

                // skeleton 2
                SdVerticalSpacing(xRatio: 2),
                SdSkeleton(height: 80),

                // skeleton 3
                SdVerticalSpacing(xRatio: 2),
                SdSkeleton(height: 20),
                SdVerticalSpacing(),
                SdSkeleton(height: 20),
                SdVerticalSpacing(),
                SdSkeleton(height: 20),
                SdVerticalSpacing(),
                SdSkeleton(height: 20),

                // skeleton 4
                SdVerticalSpacing(xRatio: 2),
                SdSkeleton(height: 80),

                // skeleton 5
                SdVerticalSpacing(xRatio: 2),
                SdSkeleton(height: 20),
                SdVerticalSpacing(),
                SdSkeleton(height: 20),
                SdVerticalSpacing(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
