import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, Products>> getRecommendProducts({
    required ProductsFilterParams params,
  });
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Product>> getProductDetail({required int productId});
}
