import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
