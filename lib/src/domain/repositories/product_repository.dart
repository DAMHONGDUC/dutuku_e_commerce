import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/entities.dart';

abstract class ProductRepository {
  Future<Either<ConfigFailure, Products>> getRecommendProducts({
    required ProductsFilterParams params,
  });
  Future<Either<ConfigFailure, List<Category>>> getCategories();
}
