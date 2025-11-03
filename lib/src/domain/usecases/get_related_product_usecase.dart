import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';
import 'package:dutuku_e_commerce/src/domain/repositories/product_repository.dart';

class GetRelatedProductUsecase
    implements UseCase<List<ProductEntity>, GetRelatedProductParams> {
  final ProductRepository repository;

  GetRelatedProductUsecase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
    GetRelatedProductParams params,
  ) async {
    return await repository.getRelatedProducts(
      productId: params.productId,
      limit: params.limit,
    );
  }
}

class GetRelatedProductParams {
  final String productId;
  final int? limit;

  GetRelatedProductParams({required this.productId, required this.limit});
}
