import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMyOrderUsecase implements UseCase<OrdersData, GetMyOrderFilterParams> {
  final OrderRepository repository;

  GetMyOrderUsecase(this.repository);

  @override
  Future<Either<Failure, OrdersData>> call(
    GetMyOrderFilterParams params,
  ) async {
    return await repository.getMyOrder(params: params);
  }
}
