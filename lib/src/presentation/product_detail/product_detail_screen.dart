import 'package:collection/collection.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

import 'color_selection_section/color_selection_section.dart';
import 'product_detail_app_bar.dart/product_detail_app_bar.dart';
import 'product_detail_app_bar.dart/product_detail_app_bar_controller.dart';
import 'product_detail_args.dart';
import 'product_detail_controller.dart';
import 'related_product_section/related_products_controller.dart';
import 'related_product_section/related_products_section.dart';

part 'components/bottom_action_section.dart';
part 'components/description_section.dart';
part 'components/product_introduce_section.dart';
part 'components/review_section.dart';

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
        BlocProvider(
          create: (_) =>
              getIt<RelatedProductsController>()
                ..getData(productId: args.productId),
        ),
        BlocProvider(create: (_) => getIt<ProductDetailAppBarController>()),
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
                return BottomActionSection(price: state.product.price);
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

class _ProductInfoView extends StatefulWidget {
  const _ProductInfoView({required this.product});

  final Product product;

  @override
  State<_ProductInfoView> createState() => __ProductInfoViewState();
}

class __ProductInfoViewState extends State<_ProductInfoView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      context.read<ProductDetailAppBarController>().setScrollOffset(
        _scrollController.offset,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        // App Bar
        ProductDetailAppBar(product: widget.product, imgHeight: _kImgHeight),

        // Product introduce section
        SliverToBoxAdapter(
          child: ProductIntroduceSection(product: widget.product),
        ),

        // Color selection section
        if (widget.product.productColors.isNotEmpty) ...[
          _SeperateSection(),
          SliverToBoxAdapter(
            child: ColorSelectionSection(
              productColors: widget.product.productColors,
            ),
          ),
        ],

        // Review section
        _SeperateSection(),
        SliverToBoxAdapter(child: ReviewSection(product: widget.product)),

        // Description section
        _SeperateSection(),
        SliverToBoxAdapter(
          child: DescriptionSection(description: widget.product.description),
        ),

        // Related projects
        _SeperateSection(),
        SliverToBoxAdapter(child: RelatedProductsSection()),
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

class _SeperateSection extends StatelessWidget {
  const _SeperateSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SdVerticalSpacing(
        bgColor: context.colorTheme.pageDefault,
        value: SdSpacing.s8,
      ),
    );
  }
}
