import 'package:equatable/equatable.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/product_color.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/product_size.dart';

class OrderEntity extends Equatable {
  final String id;
  final String productName;
  final String productId;
  final int quantity;
  final OrderStatus status;
  final double totalPrice;
  final String productThumbnailUrl;
  final ProductColor productColor;
  final ProductSize productSize;

  const OrderEntity({
    required this.id,
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
    String? id,
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
      id: id ?? this.id,
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
    id,
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
