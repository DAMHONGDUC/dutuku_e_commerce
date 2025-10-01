import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/presentation/product_detail/product_detail_args.dart';
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
        } else if (state is RecommendProductsLoadedState) {
          return SdListView(
            viewType: SdListViewType.masonryGrid,
            items: state.products,
            gridCrossAxisCount: 2,
            gridMainAxisSpacing: SdSpacing.s16,
            gridCrossAxisSpacing: SdSpacing.s16,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductCard(
                product: product,
                onPress: () {
                  GoRouter.of(context).push(
                    AppRoutes.productDetail.fullPath,
                    extra: ProductDetailArgs(productId: product.id),
                  );
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
