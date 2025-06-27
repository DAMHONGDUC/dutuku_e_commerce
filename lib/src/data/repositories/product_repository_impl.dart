import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:system_design_flutter/index.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl();

  @override
  Future<Either<ConfigFailure, List<Product>>> getRecommendProducts() async {
    await SdHelper.delayLoading();

    return Right(List.of(MockData.products)..shuffle());
  }

  @override
  Future<Either<ConfigFailure, List<Category>>> getCategories() async {
    await SdHelper.delayLoading();

    return Right([...MockData.categories, ...MockData.categories]);
  }
}
