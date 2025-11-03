import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:system_design_flutter/index.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl();

  @override
  Future<Either<Failure, List<ProductEntity>>> getRecommendProducts({
    int? limit,
  }) async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    final list = [...ProductMock.products, ...ProductMock.products].shuffled();

    if (limit != null) {
      return Right(list.shuffled().take(limit).toList());
    } else {
      return Right(list.shuffled());
    }
  }

  @override
  Future<Either<Failure, ProductsData>> searchProducts({
    required SearchProductsFilterParams params,
  }) async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    final total = ProductMock.totalRecord;
    final totalPage = (total / params.itemCount).ceil();

    final start = (params.page - 1) * params.itemCount;
    final end = (start + params.itemCount).clamp(0, total);

    final products = <ProductEntity>[];
    for (var i = start; i < end; i++) {
      products.add(ProductMock.products[i % ProductMock.products.length]);
    }

    return Right(
      ProductsData(
        items: products,
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
  Future<Either<Failure, ProductEntity>> getProductDetail({
    required String productId,
  }) async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    final product = ProductMock.products.firstWhereOrNull(
      (e) => e.id == productId,
    );

    return product != null ? Right(product) : Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getRelatedProducts({
    required String productId,
    int? limit,
  }) async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    return getRecommendProducts(limit: limit);
  }
}
