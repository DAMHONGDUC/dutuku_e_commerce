import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:system_design_flutter/utils/utils.dart';

class OrderMock {
  static Order generateOrderMockItem() {
    final randomProduct = ProductMock.products.getRandomItem();
    final randomQuantity = SdHelper.randomInt(min: 1, max: 10);
    final randomStatus = OrderStatusExt.allStatus.getRandomItem();

    return Order(
      productName: randomProduct.name,
      productId: randomProduct.id,
      quantity: randomQuantity,
      status: randomStatus,
      totalPrice: randomProduct.price * randomQuantity,
      productThumbnailUrl: randomProduct.imageUrl,
    );
  }

  static List<Order> generateOrders({int count = 10}) {
    return List.generate(count, (_) => generateOrderMockItem());
  }
}
