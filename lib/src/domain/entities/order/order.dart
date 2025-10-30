import 'package:dutuku_e_commerce/src/core/core.dart';

class Order {
  final String productName;
  final String productId;
  final int quantity;
  final OrderStatus status;
  final double totalPrice;
  final String productThumbnailUrl;

  Order({
    required this.productName,
    required this.productId,
    required this.quantity,
    required this.status,
    required this.totalPrice,
    required this.productThumbnailUrl,
  });
}
