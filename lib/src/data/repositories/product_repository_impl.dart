import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:system_design_flutter/index.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl();

  @override
  Future<Either<Failure, Products>> getRecommendProducts({
    required ProductsFilterParams params,
  }) async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    if (params.getRecommendProject) {
      final list = [...ProductMock.products, ...ProductMock.products];
      return Right(
        Products(
          products: list,
          totalPage: 1,
          currentPage: params.page,
          totalRecord: list.length,
        ),
      );
    }

    final total = ProductMock.totalRecord;
    final totalPage = (total / params.itemCount).ceil();

    final start = (params.page - 1) * params.itemCount;
    final end = (start + params.itemCount).clamp(0, total);

    final products = <Product>[];
    for (var i = start; i < end; i++) {
      products.add(ProductMock.products[i % ProductMock.products.length]);
    }

    return Right(
      Products(
        products: products,
        totalPage: totalPage,
        currentPage: params.page,
        totalRecord: total,
      ),
    );
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    return Right(CategoryMock.categories);
  }

  @override
  Future<Either<Failure, Product>> getProductDetail({
    required int productId,
  }) async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    final product = ProductMock.products.firstWhereOrNull(
      (e) => e.id == productId,
    );

    return product != null ? Right(product) : Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Products>> getRelatedProducts({
    required int productId,
  }) async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    return getRecommendProducts(params: ProductsFilterParams.init());
  }
}
