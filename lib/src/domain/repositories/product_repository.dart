import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductsData>> searchProducts({
    required SearchProductsFilterParams params,
  });
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Product>> getProductDetail({
    required String productId,
  });
  Future<Either<Failure, List<Product>>> getRelatedProducts({
    required String productId,
    int? limit,
  });
  Future<Either<Failure, List<Product>>> getRecommendProducts({int? limit});
}
