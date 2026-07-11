import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/data/mapper/product_color_model_to_product_color_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/product/data/mapper/product_size_model_to_product_size_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/order/data/models/order_model.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/entities/order_entity.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/product_color.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/product_size.dart';

class OrderModelToOrderEntityMapper {
  const OrderModelToOrderEntityMapper._();

  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      id: model.id ?? '',
      productName: model.productName ?? '',
      productId: model.productId ?? '',
      quantity: model.quantity ?? 0,
      status: model.status ?? OrderStatus.none,
      totalPrice: model.totalPrice ?? 0,
      productThumbnailUrl: model.productThumbnailUrl ?? '',
      productColor: model.productColor != null
          ? ProductColorModelToProductColorEntityMapper.toEntity(
              model.productColor!,
            )
          : const ProductColor(colorName: '', imageUrl: '', colorCode: ''),
      productSize: model.productSize != null
          ? ProductSizeModelToProductSizeEntityMapper.toEntity(
              model.productSize!,
            )
          : const ProductSize(id: '', name: ''),
    );
  }
}
