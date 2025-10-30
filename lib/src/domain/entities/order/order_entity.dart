import 'package:dutuku_e_commerce/src/core/core.dart';

class OrderEntity {
  final String productName;
  final String productId;
  final int quantity;
  final OrderStatus status;
  final double totalPrice;
  final String productThumbnailUrl;

  OrderEntity({
    required this.productName,
    required this.productId,
    required this.quantity,
    required this.status,
    required this.totalPrice,
    required this.productThumbnailUrl,
  });
}
