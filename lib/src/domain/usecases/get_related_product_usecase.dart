import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';
import 'package:dutuku_e_commerce/src/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRelatedProductUsecase implements UseCase<Products, int> {
  final ProductRepository repository;

  GetRelatedProductUsecase(this.repository);

  @override
  Future<Either<Failure, Products>> call(int productId) async {
    return await repository.getRelatedProducts(productId: productId);
  }
}
