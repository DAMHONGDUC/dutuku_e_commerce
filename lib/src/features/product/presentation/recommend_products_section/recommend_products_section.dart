import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/product_detail/product_detail_args.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/product_detail/config/product_routes.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/widgets/product_card.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/widgets/product_grid_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/index.dart';

import 'recommend_products_controller.dart';

class RecommendProductsSection extends StatelessWidget {
  const RecommendProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendProductsController, RecommendProductsState>(
      listener: (context, state) {
        // TODO: implement listener if need
      },
      builder: (context, state) {
        if (state is RecommendProductsLoadingState) {
          return ProductGridSkeleton();
        } else if (state is RecommendProductsLoadedState ||
            state is RecommendProductsLoadingLoadMoreState) {
          final products = state is RecommendProductsLoadedState
              ? state.products
              : (state as RecommendProductsLoadingLoadMoreState).products;
          final isLoadingMore = state is RecommendProductsLoadingLoadMoreState;

          return Column(
            children: [
              SdGridView(
                items: products,
                gridCrossAxisCount: 2,
                gridMainAxisSpacing: SdSpacing.s16,
                gridCrossAxisSpacing: SdSpacing.s16,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    onPress: () {
                      GoRouter.of(context).push(
                        ProductRoutes.productDetail.fullPath,
                        extra: ProductDetailArgs(productId: product.id),
                      );
                    },
                  );
                },
              ),
              if (isLoadingMore) ...[
                SdVerticalSpacing(),
                const Center(
                  child: SizedBox(
                    width: SdSpacing.s28,
                    height: SdSpacing.s28,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
                ),
              ],
            ],
          );
        } else if (state is RecommendProductsErrorState) {
          return EmptyView(message: state.errorMsg);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
