import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/product/data/mapper/product_model_to_product_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/product/data/mapper/products_data_model_to_products_data_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/product/data/mapper/recommend_products_data_model_to_recommend_products_data_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({required this.dataSource});

  final ProductRemoteDataSource dataSource;

  @override
  Future<Either<Failure, RecommendProductsData>> getRecommendProducts({
    required GetRecommendProjectFilterParams params,
  }) async {
    try {
      final result = await dataSource.getRecommendProducts(params: params);
      return Right(
        RecommendProductsDataModelToRecommendProductsDataEntityMapper.toEntity(
          result,
        ),
      );
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductsData>> searchProducts({
    required SearchProductsFilterParams params,
  }) async {
    try {
      final result = await dataSource.searchProducts(params: params);

      return Right(
        ProductsDataModelToProductsDataEntityMapper.toEntity(result),
      );
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductDetail({
    required String productId,
  }) async {
    try {
      final result = await dataSource.getProductDetail(productId: productId);

      return Right(ProductModelToProductEntityMapper.toEntity(result));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getRelatedProducts({
    required String productId,
    int? limit,
  }) async {
    try {
      final result = await dataSource.getRelatedProducts(
        productId: productId,
        limit: limit,
      );

      return Right(
        result
            .map((e) => ProductModelToProductEntityMapper.toEntity(e))
            .toList(),
      );
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
