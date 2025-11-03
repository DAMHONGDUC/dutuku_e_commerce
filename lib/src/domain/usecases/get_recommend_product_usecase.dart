import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';
import 'package:dutuku_e_commerce/src/domain/repositories/product_repository.dart';

class GetRecommendProductUsecase
    implements UseCase<List<ProductEntity>, GetRecommendProductParams> {
  final ProductRepository repository;

  GetRecommendProductUsecase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
    GetRecommendProductParams params,
  ) async {
    return await repository.getRecommendProducts(limit: params.limit);
  }
}

class GetRecommendProductParams {
  final int? limit;

  GetRecommendProductParams({required this.limit});
}
