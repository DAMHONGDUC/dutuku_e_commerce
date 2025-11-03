import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

class GetProductDetailUsecase implements UseCase<ProductEntity, String> {
  final ProductRepository repository;

  GetProductDetailUsecase(this.repository);

  @override
  Future<Either<Failure, ProductEntity>> call(String productId) async {
    return await repository.getProductDetail(productId: productId);
  }
}
