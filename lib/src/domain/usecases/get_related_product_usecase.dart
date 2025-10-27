import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';
import 'package:dutuku_e_commerce/src/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRelatedProductUsecase
    implements UseCase<List<Product>, GetRelatedProductParams> {
  final ProductRepository repository;

  GetRelatedProductUsecase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(
    GetRelatedProductParams params,
  ) async {
    return await repository.getRelatedProducts(
      productId: params.productId,
      limit: params.limit,
    );
  }
}

class GetRelatedProductParams {
  final int productId;
  final int? limit;

  GetRelatedProductParams({required this.productId, required this.limit});
}
