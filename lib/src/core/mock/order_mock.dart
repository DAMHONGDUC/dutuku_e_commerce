import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:system_design_flutter/utils/utils.dart';

class OrderMock {
  static OrderEntity generateOrderMockItem() {
    final randomProduct = ProductMock.products.getRandomItem();
    final randomQuantity = SdHelper.randomInt(min: 1, max: 10);
    final randomStatus = OrderStatusExt.tabs.getRandomItem();

    return OrderEntity(
      productName: randomProduct.name,
      productId: randomProduct.id,
      quantity: randomQuantity,
      status: randomStatus,
      totalPrice: randomProduct.price * randomQuantity,
      productThumbnailUrl: randomProduct.imageUrl,
    );
  }

  static List<OrderEntity> generateOrders({int count = 10}) {
    return List.generate(count, (_) => generateOrderMockItem());
  }
}
