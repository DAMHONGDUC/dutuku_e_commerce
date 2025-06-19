import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/home/banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  DashboardTab({super.key});

  final List<BannerItem> banners = [
    BannerItem(
      imageUrl: 'assets/images/banner_1.png',
      tag: '24% OFF',
      title: 'Shipping Today',
      subtitle: 'On bag purchases',
      price: '\$279.99',
      tagType: BannerTagTypeEnum.discount,
      contentColor: '#000000',
    ),
    BannerItem(
      imageUrl: 'assets/images/banner_2.png',
      tag: 'New',
      title: 'Leather Tote',
      subtitle: 'Elegant and spacious',
      price: '\$249.99',
      tagType: BannerTagTypeEnum.newArrival,
      contentColor: '#000000',
    ),
    BannerItem(
      imageUrl: 'assets/images/banner_3.png',
      tag: 'Limited',
      title: 'Mini Shoulder Bag',
      subtitle: 'Stylish and compact',
      price: '\$189.00',
      tagType: BannerTagTypeEnum.limited,
      contentColor: '#FFFFFF',
    ),
    BannerItem(
      imageUrl: 'assets/images/banner_4.png',
      tag: 'Hot',
      title: 'Everyday Essentials',
      subtitle: 'Best seller this week',
      price: 'From \$99.99',
      tagType: BannerTagTypeEnum.hot,
      contentColor: '#FFFFFF',
    ),
  ];

  final List<Product> products = [
    Product(
      name: 'The Mirac Jiz',
      brand: 'Lisa Robber',
      price: 195.00,
      imageUrl: 'assets/images/banner_4.png',
    ),
    Product(
      name: 'Meriza Kiles',
      brand: 'Gazuna Resika',
      price: 143.45,
      imageUrl: 'assets/images/banner_4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        BannerCarousel(banners: banners),
        const SizedBox(height: 24),
        _buildSectionHeader(context),
        const SizedBox(height: 12),
        _buildProductGrid(),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'New Arrivals 🔥',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text('See All', style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(product.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.favorite_border, color: Colors.grey.shade600),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(product.brand, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
