import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';

class SearchProductsUsecase
    implements UseCase<ProductsData, SearchProductsFilterParams> {
  final ProductRepository repository;

  SearchProductsUsecase(this.repository);

  @override
  Future<Either<Failure, ProductsData>> call(
    SearchProductsFilterParams params,
  ) async {
    return await repository.searchProducts(params: params);
  }
}
