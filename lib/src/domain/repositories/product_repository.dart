import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, Products>> searchProducts({
    required SearchProductsFilterParams params,
  });
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Product>> getProductDetail({required int productId});
  Future<Either<Failure, List<Product>>> getRelatedProducts({
    required int productId,
    int? limit,
  });
  Future<Either<Failure, List<Product>>> getRecommendProducts({int? limit});
}
