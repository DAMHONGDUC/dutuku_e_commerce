import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/order/data/models/order_model.dart';
import 'package:dutuku_e_commerce/src/features/product/data/mock/product_mock.dart';
import 'package:system_design_flutter/utils/utils.dart';
import 'package:uuid/uuid.dart';

class OrderMock {
  static OrderModel generateOrderMockItem() {
    final randomProduct = ProductMock.products.getRandomItem();
    final randomQuantity = SdHelper.randomInt(min: 1, max: 10);
    final randomStatus = OrderStatusExt.tabs.getRandomItem();

    return OrderModel(
      id: const Uuid().v4(),
      productName: randomProduct.name,
      productId: randomProduct.id,
      quantity: randomQuantity,
      status: randomStatus,
      totalPrice: (randomProduct.price ?? 0) * randomQuantity,
      productThumbnailUrl: randomProduct.imageUrl,
      productColor: randomProduct.productColors?.getRandomItem(),
      productSize: randomProduct.productSizes?.getRandomItem(),
    );
  }

  static List<OrderModel> generateOrders({int count = 10}) {
    return List.generate(count, (_) => generateOrderMockItem());
  }
}
