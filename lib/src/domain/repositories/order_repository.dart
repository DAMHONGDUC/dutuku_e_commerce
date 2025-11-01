import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrdersData>> getMyOrder({
    required GetMyOrderFilterParams params,
  });
}
