import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockOrderRepository repository;
  late GetMyOrderUsecase usecase;

  setUp(() {
    repository = MockOrderRepository();
    usecase = GetMyOrderUsecase(repository);
  });

  const tOrder = OrderEntity(
    id: 'order-1',
    productName: 'Margaux Leather',
    productId: '1',
    quantity: 2,
    status: OrderStatus.waitingForConfirmation,
    totalPrice: 390.0,
    productThumbnailUrl: 'assets/images/product/p1_1.png',
    productColor: ProductColor(
      colorName: 'Onyx',
      imageUrl: 'assets/images/product/p1_1.png',
      colorCode: '#2C2C2C',
    ),
    productSize: ProductSize(id: 'M', name: 'M'),
  );

  const tOrdersData = OrdersData(
    items: [tOrder],
    totalPage: 1,
    currentPage: 1,
    totalRecord: 1,
  );

  final tParams = GetMyOrderFilterParams.init();

  test('should return orders from the repository on success', () async {
    when(
      () => repository.getMyOrder(params: tParams),
    ).thenAnswer((_) async => const Right(tOrdersData));

    final result = await usecase.call(tParams);

    expect(result, const Right(tOrdersData));
    verify(() => repository.getMyOrder(params: tParams)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a Failure when the repository fails', () async {
    final failure = ServerFailure();
    when(
      () => repository.getMyOrder(params: tParams),
    ).thenAnswer((_) async => Left(failure));

    final result = await usecase.call(tParams);

    expect(result, Left(failure));
  });
}
