import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/order/data/data_sources/order_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late OrderRemoteDataSourceImpl dataSource;

  setUp(() {
    // The mock cache is a static/singleton-like map shared across instances,
    // so it must be cleared before each test for isolation.
    OrderRemoteDataSourceImpl.clearMockCache();
    dataSource = OrderRemoteDataSourceImpl();
  });

  group('getMyOrder', () {
    test('should paginate the mock orders for the given status', () async {
      final firstPage = await dataSource.getMyOrder(
        params: const GetMyOrderFilterParams(
          pageNumber: 1,
          itemCount: 10,
          status: OrderStatus.waitingForConfirmation,
        ),
      );

      // waitingForConfirmation has 20 mock records configured.
      expect(firstPage.totalRecord, 20);
      expect(firstPage.totalPage, 2);
      expect(firstPage.currentPage, 1);
      expect(firstPage.items?.length, 10);
      expect(
        firstPage.items!.every(
          (e) => e.status == OrderStatus.waitingForConfirmation,
        ),
        isTrue,
      );

      final secondPage = await dataSource.getMyOrder(
        params: const GetMyOrderFilterParams(
          pageNumber: 2,
          itemCount: 10,
          status: OrderStatus.waitingForConfirmation,
        ),
      );

      expect(secondPage.items?.length, 10);

      final thirdPage = await dataSource.getMyOrder(
        params: const GetMyOrderFilterParams(
          pageNumber: 3,
          itemCount: 10,
          status: OrderStatus.waitingForConfirmation,
        ),
      );

      expect(thirdPage.items, isEmpty);
    });

    test(
      'should return an empty list for a status with no mock records',
      () async {
        final result = await dataSource.getMyOrder(
          params: const GetMyOrderFilterParams(
            pageNumber: 1,
            itemCount: 10,
            status: OrderStatus.waitingForPickup,
          ),
        );

        expect(result.totalRecord, 0);
        expect(result.items, isEmpty);
      },
    );
  });

  group('getOrderDetail', () {
    test('should return the matching order when it exists', () async {
      final listResult = await dataSource.getMyOrder(
        params: const GetMyOrderFilterParams(
          pageNumber: 1,
          itemCount: 10,
          status: OrderStatus.delivered,
        ),
      );

      final knownOrder = listResult.items!.first;

      final detailResult = await dataSource.getOrderDetail(
        orderId: knownOrder.id!,
      );

      expect(detailResult?.id, knownOrder.id);
    });

    test('should return null when the order id is unknown', () async {
      final result = await dataSource.getOrderDetail(orderId: 'unknown-id');

      expect(result, isNull);
    });
  });
}
