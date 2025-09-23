import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductDetailUsecase implements UseCase<Product, int> {
  final ProductRepository repository;

  GetProductDetailUsecase(this.repository);

  @override
  Future<Either<Failure, Product>> call(int productId) async {
    return await repository.getProductDetail(productId: productId);
  }
}
