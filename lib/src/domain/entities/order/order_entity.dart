import 'package:equatable/equatable.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product_color.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product/product_size.dart';

class OrderEntity extends Equatable {
  final String productName;
  final String productId;
  final int quantity;
  final OrderStatus status;
  final double totalPrice;
  final String productThumbnailUrl;
  final ProductColor productColor;
  final ProductSize productSize;

  const OrderEntity({
    required this.productName,
    required this.productId,
    required this.quantity,
    required this.status,
    required this.totalPrice,
    required this.productThumbnailUrl,
    required this.productColor,
    required this.productSize,
  });

  OrderEntity copyWith({
    String? productName,
    String? productId,
    int? quantity,
    OrderStatus? status,
    double? totalPrice,
    String? productThumbnailUrl,
    ProductColor? productColor,
    ProductSize? productSize,
  }) {
    return OrderEntity(
      productName: productName ?? this.productName,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      productThumbnailUrl: productThumbnailUrl ?? this.productThumbnailUrl,
      productColor: productColor ?? this.productColor,
      productSize: productSize ?? this.productSize,
    );
  }

  @override
  List<Object?> get props => [
    productName,
    productId,
    quantity,
    status,
    totalPrice,
    productThumbnailUrl,
    productColor,
    productSize,
  ];
}
