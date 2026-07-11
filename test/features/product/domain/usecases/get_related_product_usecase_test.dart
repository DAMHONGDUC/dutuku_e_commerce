import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockProductRepository repository;
  late GetRelatedProductUsecase usecase;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetRelatedProductUsecase(repository);
  });

  const tProducts = [
    ProductEntity(
      id: '2',
      name: 'Vancouver Crossbody',
      brand: 'Bag',
      price: 143.45,
      imageUrl: 'assets/images/product/p2_2.png',
      purchaserCount: 85,
      reviewComments: [],
      averageRating: 4.2,
    ),
  ];

  // GetRelatedProductParams isn't Equatable, so the exact same instance is
  // used for stubbing and invocation to match by reference.
  final tParams = GetRelatedProductParams(productId: '1', limit: 6);

  test(
    'should return related products from the repository on success',
    () async {
      when(
        () => repository.getRelatedProducts(
          productId: tParams.productId,
          limit: tParams.limit,
        ),
      ).thenAnswer((_) async => const Right(tProducts));

      final result = await usecase.call(tParams);

      expect(result, const Right(tProducts));
      verify(
        () => repository.getRelatedProducts(
          productId: tParams.productId,
          limit: tParams.limit,
        ),
      ).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test('should return a Failure when the repository fails', () async {
    final failure = ServerFailure();
    when(
      () => repository.getRelatedProducts(
        productId: tParams.productId,
        limit: tParams.limit,
      ),
    ).thenAnswer((_) async => Left(failure));

    final result = await usecase.call(tParams);

    expect(result, Left(failure));
  });
}
