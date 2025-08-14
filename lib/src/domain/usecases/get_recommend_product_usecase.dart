import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';
import 'package:dutuku_e_commerce/src/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecommendProductUsecase
    implements UseCase<Products, ProductsFilterParams> {
  final ProductRepository repository;

  GetRecommendProductUsecase(this.repository);

  @override
  Future<Either<ConfigFailure, Products>> call(
    ProductsFilterParams params,
  ) async {
    return await repository.getRecommendProducts(params: params);
  }
}
