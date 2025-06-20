import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'product_grid_controller.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductGridController>()..fetchProducts(),
      child: BlocConsumer<ProductGridController, ProductGridState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ProductGridLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductGridLoaded) {
            return MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: SdSpacing.s16,
              crossAxisSpacing: SdSpacing.s16,
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
      ),
    );
  }
}
