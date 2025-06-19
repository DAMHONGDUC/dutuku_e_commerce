import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/home/banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        BannerCarousel(),
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
    // return GridView.builder(
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: products.length,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 16,
    //     crossAxisSpacing: 16,
    //     childAspectRatio: 0.7,
    //   ),
    //   itemBuilder: (context, index) {
    //     final product = products[index];
    //     return _buildProductCard(product);
    //   },
    // );
    return SizedBox.shrink();
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
