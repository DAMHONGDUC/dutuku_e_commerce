import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockProductRepository repository;
  late GetProductDetailUsecase usecase;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetProductDetailUsecase(repository);
  });

  const tProductId = '1';
  const tProduct = ProductEntity(
    id: tProductId,
    name: 'Margaux Leather',
    brand: 'Handbag',
    price: 195.0,
    imageUrl: 'assets/images/product/p1_1.png',
    purchaserCount: 120,
    reviewComments: [],
    averageRating: 4.5,
  );

  test(
    'should return the product detail from the repository on success',
    () async {
      when(
        () => repository.getProductDetail(productId: tProductId),
      ).thenAnswer((_) async => const Right(tProduct));

      final result = await usecase.call(tProductId);

      expect(result, const Right(tProduct));
      verify(
        () => repository.getProductDetail(productId: tProductId),
      ).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test('should return a Failure when the product is not found', () async {
    final failure = ServerFailure();
    when(
      () => repository.getProductDetail(productId: tProductId),
    ).thenAnswer((_) async => Left(failure));

    final result = await usecase.call(tProductId);

    expect(result, Left(failure));
  });
}
