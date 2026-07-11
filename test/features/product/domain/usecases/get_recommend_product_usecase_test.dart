import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockProductRepository repository;
  late GetRecommendProductUsecase usecase;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetRecommendProductUsecase(repository);
  });

  const tProduct = ProductEntity(
    id: '1',
    name: 'Margaux Leather',
    brand: 'Handbag',
    price: 195.0,
    imageUrl: 'assets/images/product/p1_1.png',
    purchaserCount: 120,
    reviewComments: [],
    averageRating: 4.5,
  );

  const tRecommendProductsData = RecommendProductsData(
    items: [tProduct],
    totalPage: 2,
    currentPage: 1,
    totalRecord: 12,
  );

  final tParams = GetRecommendProjectFilterParams.init();

  test(
    'should return the recommended products from the repository on success',
    () async {
      when(
        () => repository.getRecommendProducts(params: tParams),
      ).thenAnswer((_) async => const Right(tRecommendProductsData));

      final result = await usecase.call(tParams);

      expect(result, const Right(tRecommendProductsData));
      verify(() => repository.getRecommendProducts(params: tParams)).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test('should return a Failure when the repository fails', () async {
    final failure = ServerFailure();
    when(
      () => repository.getRecommendProducts(params: tParams),
    ).thenAnswer((_) async => Left(failure));

    final result = await usecase.call(tParams);

    expect(result, Left(failure));
  });
}
