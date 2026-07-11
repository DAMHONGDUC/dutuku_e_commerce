import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/order/data/data_sources/order_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/order/data/mapper/order_model_to_order_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/order/data/mapper/orders_data_model_to_orders_data_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';

class OrderRepositoryImpl implements OrderRepository {
  const OrderRepositoryImpl({required this.dataSource});

  final OrderRemoteDataSource dataSource;

  @override
  Future<Either<Failure, OrdersData>> getMyOrder({
    required GetMyOrderFilterParams params,
  }) async {
    try {
      final result = await dataSource.getMyOrder(params: params);

      return Right(OrdersDataModelToOrdersDataEntityMapper.toEntity(result));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderDetail({
    required String orderId,
  }) async {
    try {
      final result = await dataSource.getOrderDetail(orderId: orderId);

      if (result == null) return Left(ServerFailure());

      return Right(OrderModelToOrderEntityMapper.toEntity(result));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
