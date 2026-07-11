import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/entities/get_my_order_filter_params.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/entities/order_entity.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/entities/orders_data.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrdersData>> getMyOrder({
    required GetMyOrderFilterParams params,
  });

  Future<Either<Failure, OrderEntity>> getOrderDetail({
    required String orderId,
  });
}
