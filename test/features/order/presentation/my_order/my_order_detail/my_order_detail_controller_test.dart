import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/order/presentation/my_order/my_order_detail/my_order_detail_controller.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/mock_usecases.dart';

void main() {
  late MockGetOrderDetailUsecase usecase;
  late MyOrderDetailController controller;

  const tOrderId = 'order-1';
  const tOrder = OrderEntity(
    id: tOrderId,
    productName: 'Margaux Leather',
    productId: '1',
    quantity: 2,
    status: OrderStatus.delivered,
    totalPrice: 390.0,
    productThumbnailUrl: 'assets/images/product/p1_1.png',
    productColor: ProductColor(
      colorName: 'Onyx',
      imageUrl: 'assets/images/product/p1_1.png',
      colorCode: '#2C2C2C',
    ),
    productSize: ProductSize(id: 'M', name: 'M'),
  );

  setUp(() {
    usecase = MockGetOrderDetailUsecase();
    controller = MyOrderDetailController(usecase);
  });

  tearDown(() => controller.close());

  blocTest<MyOrderDetailController, MyOrderDetailState>(
    'emits [Loading, Loaded] when the usecase succeeds',
    setUp: () {
      when(
        () => usecase.call(tOrderId),
      ).thenAnswer((_) async => const Right(tOrder));
    },
    build: () => controller,
    act: (c) => c.getOrderDetail(orderId: tOrderId),
    expect: () => [
      MyOrderDetailLoadingState(),
      const MyOrderDetailLoadedState(order: tOrder),
    ],
  );

  blocTest<MyOrderDetailController, MyOrderDetailState>(
    'emits [Loading, Error] when the order is not found',
    setUp: () {
      when(
        () => usecase.call(tOrderId),
      ).thenAnswer((_) async => Left(ServerFailure()));
    },
    build: () => controller,
    act: (c) => c.getOrderDetail(orderId: tOrderId),
    expect: () => [
      MyOrderDetailLoadingState(),
      const MyOrderDetailErrorState(errorMsg: 'something wrong'),
    ],
  );
}
