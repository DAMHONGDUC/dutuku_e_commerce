import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:system_design_flutter/index.dart';

class OrderRepositoryImpl implements OrderRepository {
  const OrderRepositoryImpl();

  @override
  Future<Either<Failure, OrdersData>> getMyOrder({
    required GetMyOrderFilterParams params,
  }) async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    final items = OrderMock.generateOrders(count: 10);

    return Right(
      OrdersData(
        currentPage: 1,
        totalPage: 1,
        items: items.where((e) => e.status == params.status).toList(),
        totalRecord: 10,
      ),
    );
  }
}
