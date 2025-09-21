import 'package:flutter/material.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product_color.dart';

import 'color_selection_section/color_selection_section.dart';
import 'components/bottom_action_section.dart';
import 'components/description_section.dart';
import 'components/product_image_section.dart';
import 'components/product_info_section.dart';
import 'product_detail_args.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDetailArgs args;

  const ProductDetailScreen({super.key, required this.args});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 3;
  int selectedColorIndex = 0;
  late Product currentProduct;

  @override
  void initState() {
    super.initState();
    // Use provided product or create sample data
    currentProduct = _createSampleProduct();
  }

  Product _createSampleProduct() {
    return const Product(
      id: 1883,
      name: 'Box Bag Linar 1883',
      brand: 'Premium Bags',
      price: 35.25,
      imageUrl: 'assets/product/p1_1.png',
      productColors: [
        ProductColor(
          colorName: 'Brown',
          colorCode: '#B87D6A',
          imageUrl: 'assets/product/p1_2.png',
        ),
        ProductColor(
          colorName: 'Black',
          colorCode: '#000000',
          imageUrl: 'assets/product/p1_3.png',
        ),
        ProductColor(
          colorName: 'Teal',
          colorCode: '#4DB6AC',
          imageUrl: 'assets/product/p1_4.png',
        ),
      ],
    );
  }

  void _updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity > 0 ? newQuantity : 1;
    });
  }

  void _selectColor(int index) {
    setState(() {
      selectedColorIndex = index;
    });
  }

  Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
                          ? currentProduct
                                .productColors[selectedColorIndex]
                                .imageUrl
                          : currentProduct.imageUrl,
                    ),

                    // Product Info Section
                    ProductInfoSection(
                      product: currentProduct,
                      quantity: quantity,
                      onQuantityChanged: _updateQuantity,
                    ),

                    // Color Selection Section
                    if (currentProduct.productColors.isNotEmpty)
                      ColorSelectionSection(
                        productColors: currentProduct.productColors,
                        selectedIndex: selectedColorIndex,
                        onColorSelected: _selectColor,
                        hexToColor: _hexToColor,
                      ),

                    // Description Section
                    const DescriptionSection(
                      description:
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
        ),
      ),
    );
  }
}
