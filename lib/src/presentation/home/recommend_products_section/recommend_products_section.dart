import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'recommend_products_controller.dart';

class RecommendProductsSection extends StatelessWidget {
  const RecommendProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RecommendProductsController>()..fetchProducts(),
      child: _RecommendProductsView(),
    );
  }
}

class _RecommendProductsView extends StatelessWidget {
  const _RecommendProductsView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendProductsController, RecommendProductsState>(
      listener: (context, state) {
        // TODO: implement listener if need
      },
      builder: (context, state) {
        if (state is RecommendProductsLoading) {
          return _ProductGridSkeleton();
        } else if (state is RecommendProductsLoaded) {
          return MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: SdSpacing.s16,
            crossAxisSpacing: SdSpacing.s16,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductCard(product: product);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _ProductGridSkeleton extends StatelessWidget {
  const _ProductGridSkeleton();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return const ProductCardSkeleton();
      },
    );
  }
}
