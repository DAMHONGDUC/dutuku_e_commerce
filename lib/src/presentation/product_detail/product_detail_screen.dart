import 'package:collection/collection.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:system_design_flutter/index.dart';

import 'color_selection_section/color_selection_controller.dart';
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
        BlocProvider(create: (_) => getIt<ColorSelectionController>()),
      ],
      child: _Body(args: args),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({required this.args});
  final ProductDetailArgs args;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late ScrollController _scrollController;

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

  Future _onRefresh(BuildContext context) async {
    context.read<ProductDetailController>().getProductDetail(
      productId: widget.args.productId,
    );
    context.read<RelatedProductsController>().getData(
      productId: widget.args.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.surfaceDefault,
      bottomNavigationBar: _BottomSection(),
      child: BlocListener<ProductDetailController, ProductDetailState>(
        listener: (context, state) {
          if (state is ProductDetailLoadedState) {
            context.read<ColorSelectionController>().onChangeColor(
              state.product.productColors.firstOrNull,
            );
          } else if (state is ProductDetailErrorState) {
            // handle error case
          }
        },
        child: RefreshWrapper(
          onRefresh: () => _onRefresh(context),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Info section
              _ProductInfoSection(),

              // Related projects
              _SeperateSection(),
              SliverToBoxAdapter(child: RelatedProductsSection()),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductInfoSection extends StatelessWidget {
  const _ProductInfoSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailController, ProductDetailState>(
      buildWhen: (previous, current) {
        return current is ProductDetailLoadingState ||
            current is ProductDetailLoadedState;
      },
      builder: (context, state) {
        if (state is ProductDetailLoadingState) {
          return MultiSliver(
            children: [SliverToBoxAdapter(child: _ProductInfoSkeleton())],
          );
        } else if (state is ProductDetailLoadedState) {
          return MultiSliver(
            children: [
              // App Bar
              ProductDetailAppBar(
                product: state.product,
                imgHeight: _kImgHeight,
              ),

              // Product introduce section
              SliverToBoxAdapter(
                child: ProductIntroduceSection(product: state.product),
              ),

              // Color selection section
              if (state.product.productColors.isNotEmpty) ...[
                _SeperateSection(),
                SliverToBoxAdapter(
                  child: ColorSelectionSection(
                    productColors: state.product.productColors,
                  ),
                ),
              ],

              // Review section
              _SeperateSection(),
              SliverToBoxAdapter(child: ReviewSection(product: state.product)),

              // Description section
              _SeperateSection(),
              SliverToBoxAdapter(
                child: DescriptionSection(
                  description: state.product.description,
                ),
              ),
            ],
          );
        }
        return SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailController, ProductDetailState>(
      buildWhen: (previous, current) {
        return current is ProductDetailLoadedState ||
            current is ProductDetailLoadingState;
      },
      builder: (context, state) {
        if (state is ProductDetailLoadedState) {
          return BottomActionSection(price: state.product.price);
        }
        return SizedBox.shrink();
      },
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
