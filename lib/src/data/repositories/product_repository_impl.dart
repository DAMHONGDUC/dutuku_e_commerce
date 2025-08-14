import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:system_design_flutter/index.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl();

  @override
  Future<Either<ConfigFailure, Products>> getRecommendProducts({
    required ProductsFilterParams params,
  }) async {
    // These is mock logic
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
  Future<Either<ConfigFailure, List<Category>>> getCategories() async {
    // These is mock logic
    await SdHelper.delayLoading();

    return Right(CategoryMock.categories);
  }
}
