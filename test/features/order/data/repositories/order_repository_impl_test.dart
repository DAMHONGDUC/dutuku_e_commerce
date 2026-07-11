import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/order/data/models/order_model.dart';
import 'package:dutuku_e_commerce/src/features/order/data/models/orders_data_model.dart';
import 'package:dutuku_e_commerce/src/features/order/data/repositories/order_repository_impl.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockOrderRemoteDataSource dataSource;
  late OrderRepositoryImpl repository;

  setUp(() {
    dataSource = MockOrderRemoteDataSource();
    repository = OrderRepositoryImpl(dataSource: dataSource);
  });

  const tOrderModel = OrderModel(
    id: 'order-1',
    productName: 'Margaux Leather',
    productId: '1',
    quantity: 2,
    status: OrderStatus.delivered,
    totalPrice: 390.0,
  );

  final tParams = GetMyOrderFilterParams.init();

  group('getMyOrder', () {
    test('should map the data source model to an OrdersData entity', () async {
      when(() => dataSource.getMyOrder(params: tParams)).thenAnswer(
        (_) async => const OrdersDataModel(
          items: [tOrderModel],
          totalPage: 1,
          currentPage: 1,
          totalRecord: 1,
        ),
      );

      final result = await repository.getMyOrder(params: tParams);

      result.fold((_) => fail('expected Right'), (data) {
        expect(data.items.single.id, 'order-1');
        expect(data.totalRecord, 1);
      });
    });

    test('should return a ServerFailure when the data source throws', () async {
      when(
        () => dataSource.getMyOrder(params: tParams),
      ).thenThrow(const ServerException());

      final result = await repository.getMyOrder(params: tParams);

      expect(result, Left(ServerFailure()));
    });
  });

  group('getOrderDetail', () {
    test('should map the data source model to an OrderEntity', () async {
      when(
        () => dataSource.getOrderDetail(orderId: 'order-1'),
      ).thenAnswer((_) async => tOrderModel);

      final result = await repository.getOrderDetail(orderId: 'order-1');

      result.fold(
        (_) => fail('expected Right'),
        (order) => expect(order.id, 'order-1'),
      );
    });

    test('should return a Failure when the data source returns null', () async {
      when(
        () => dataSource.getOrderDetail(orderId: 'unknown-id'),
      ).thenAnswer((_) async => null);

      final result = await repository.getOrderDetail(orderId: 'unknown-id');

      expect(result.isLeft(), isTrue);
    });
  });
}
