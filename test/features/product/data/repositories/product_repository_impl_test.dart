import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/product_data_model.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/product_model.dart';
import 'package:dutuku_e_commerce/src/features/product/data/models/recommend_products_data_model.dart';
import 'package:dutuku_e_commerce/src/features/product/data/repositories/product_repository_impl.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockProductRemoteDataSource dataSource;
  late ProductRepositoryImpl repository;

  setUp(() {
    dataSource = MockProductRemoteDataSource();
    repository = ProductRepositoryImpl(dataSource: dataSource);
  });

  const tProductModel = ProductModel(
    id: '1',
    name: 'Margaux Leather',
    brand: 'Handbag',
    price: 195.0,
    imageUrl: 'assets/images/product/p1_1.png',
    purchaserCount: 120,
    averageRating: 4.5,
  );

  group('getProductDetail', () {
    const tProductId = '1';

    test(
      'should map the model returned by the data source to an entity',
      () async {
        when(
          () => dataSource.getProductDetail(productId: tProductId),
        ).thenAnswer((_) async => tProductModel);

        final result = await repository.getProductDetail(productId: tProductId);

        result.fold((_) => fail('expected Right'), (product) {
          expect(product.id, tProductModel.id);
          expect(product.name, tProductModel.name);
          expect(product.price, tProductModel.price);
        });
      },
    );

    test('should return a ServerFailure when the data source throws', () async {
      when(
        () => dataSource.getProductDetail(productId: tProductId),
      ).thenThrow(const ServerException());

      final result = await repository.getProductDetail(productId: tProductId);

      expect(result, Left(ServerFailure()));
    });
  });

  group('getRelatedProducts', () {
    test('should map the list of models to a list of entities', () async {
      when(
        () => dataSource.getRelatedProducts(productId: '1', limit: 6),
      ).thenAnswer((_) async => [tProductModel]);

      final result = await repository.getRelatedProducts(
        productId: '1',
        limit: 6,
      );

      result.fold(
        (_) => fail('expected Right'),
        (products) => expect(products.single.id, tProductModel.id),
      );
    });
  });

  group('getRecommendProducts', () {
    final tParams = GetRecommendProjectFilterParams.init();

    test('should map the model to a RecommendProductsData entity', () async {
      when(() => dataSource.getRecommendProducts(params: tParams)).thenAnswer(
        (_) async => const RecommendProductsDataModel(
          items: [tProductModel],
          totalPage: 2,
          currentPage: 1,
          totalRecord: 12,
        ),
      );

      final result = await repository.getRecommendProducts(params: tParams);

      result.fold((_) => fail('expected Right'), (data) {
        expect(data.items.single.id, tProductModel.id);
        expect(data.totalPage, 2);
        expect(data.currentPage, 1);
        expect(data.totalRecord, 12);
      });
    });

    test('should return a ServerFailure on an unexpected error', () async {
      when(
        () => dataSource.getRecommendProducts(params: tParams),
      ).thenThrow(Exception('boom'));

      final result = await repository.getRecommendProducts(params: tParams);

      expect(result, Left(ServerFailure()));
    });
  });

  group('searchProducts', () {
    final tParams = SearchProductsFilterParams.init(keyword: 'margaux');

    test('should map the model to a ProductsData entity', () async {
      when(() => dataSource.searchProducts(params: tParams)).thenAnswer(
        (_) async => const ProductsDataModel(
          items: [tProductModel],
          totalPage: 1,
          currentPage: 1,
          totalRecord: 1,
        ),
      );

      final result = await repository.searchProducts(params: tParams);

      result.fold(
        (_) => fail('expected Right'),
        (data) => expect(data.items.single.id, tProductModel.id),
      );
    });
  });
}
