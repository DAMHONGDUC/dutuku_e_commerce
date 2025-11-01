import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product_color.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product_size.dart';

class OrderEntity {
  final String productName;
  final String productId;
  final int quantity;
  final OrderStatus status;
  final double totalPrice;
  final String productThumbnailUrl;
  final ProductColor productColor;
  final ProductSize productsize;

  OrderEntity({
    required this.productName,
    required this.productId,
    required this.quantity,
    required this.status,
    required this.totalPrice,
    required this.productThumbnailUrl,
    required this.productColor,
    required this.productsize,
  });
}
