import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/widgets/widgets.dart';

import 'color_selection_section/color_selection_section.dart';
import 'product_detail_args.dart';
import 'product_detail_controller.dart';

part 'components/bottom_action_section.dart';
part 'components/description_section.dart';
part 'components/product_image_section.dart';
part 'components/product_info_section.dart';

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

class _ProductDetailView extends StatefulWidget {
  final ProductDetailArgs args;

  const _ProductDetailView({required this.args});

  @override
  State<_ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<_ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return SdSafeAreaScaffold(
      backgroundColor: context.colorTheme.surfaceDefault,
      child: BlocConsumer<ProductDetailController, ProductDetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ProductDetailLoadingState) {
            // TODO: add loading UI
            return SizedBox.shrink();
          } else if (state is ProductDetailLoadedState) {
            return _ProductInfoView(currentProduct: state.product);
          } else if (state is ProductDetailErrorState) {
            // TODO: add error UI
            return SizedBox.shrink();
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}

class _ProductInfoView extends StatelessWidget {
  const _ProductInfoView({required this.currentProduct});

  final Product currentProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App Bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: Colors.black87,
                ),
              ),
              const Text(
                'Detail Product',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const Icon(
                Icons.shopping_bag_outlined,
                size: 24,
                color: Colors.black87,
              ),
            ],
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Section
                ProductImageSection(
                  imageUrl: currentProduct.productColors.isNotEmpty
                      ? currentProduct.productColors[1].imageUrl
                      : currentProduct.imageUrl,
                ),

                // Product Info Section
                ProductInfoSection(
                  product: currentProduct,
                  quantity: 1,
                  onQuantityChanged: (a) {},
                ),

                // Color Selection Section
                if (currentProduct.productColors.isNotEmpty)
                  ColorSelectionSection(
                    productColors: currentProduct.productColors,
                    selectedIndex: 1,
                    onColorSelected: (a) {},
                    hexToColor: (a) {
                      return Colors.black;
                    },
                  ),

                // Description Section
                const DescriptionSection(
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a'
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a'
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a'
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a',
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),

        // Bottom Action Section
        BottomActionSection(price: currentProduct.price),
      ],
    );
  }
}
