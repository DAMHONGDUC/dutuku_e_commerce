import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/category.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<ConfigFailure, List<Product>>> getRecommendProducts();
  Future<Either<ConfigFailure, List<Category>>> getCategories();
}
