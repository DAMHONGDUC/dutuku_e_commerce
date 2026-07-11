import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockOrderRepository repository;
  late GetOrderDetailUsecase usecase;

  setUp(() {
    repository = MockOrderRepository();
    usecase = GetOrderDetailUsecase(repository);
  });

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

  test(
    'should return the order detail from the repository on success',
    () async {
      when(
        () => repository.getOrderDetail(orderId: tOrderId),
      ).thenAnswer((_) async => const Right(tOrder));

      final result = await usecase.call(tOrderId);

      expect(result, const Right(tOrder));
      verify(() => repository.getOrderDetail(orderId: tOrderId)).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test('should return a Failure when the order is not found', () async {
    final failure = ServerFailure();
    when(
      () => repository.getOrderDetail(orderId: tOrderId),
    ).thenAnswer((_) async => Left(failure));

    final result = await usecase.call(tOrderId);

    expect(result, Left(failure));
  });
}
