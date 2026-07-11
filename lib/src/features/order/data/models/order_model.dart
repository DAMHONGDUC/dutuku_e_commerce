import 'package:dutuku_e_commerce/src/features/product/data/models/product_color_model.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/product_size_model.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';

class OrderModel {
  final String? id;
  final String? productName;
  final String? productId;
  final int? quantity;
  final OrderStatus? status;
  final double? totalPrice;
  final String? productThumbnailUrl;
  final ProductColorModel? productColor;
  final ProductSizeModel? productSize;

  const OrderModel({
    this.id,
    this.productName,
    this.productId,
    this.quantity,
    this.status,
    this.totalPrice,
    this.productThumbnailUrl,
    this.productColor,
    this.productSize,
  });

  OrderModel copyWith({
    String? id,
    String? productName,
    String? productId,
    int? quantity,
    OrderStatus? status,
    double? totalPrice,
    String? productThumbnailUrl,
    ProductColorModel? productColor,
    ProductSizeModel? productSize,
  }) {
    return OrderModel(
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
}
