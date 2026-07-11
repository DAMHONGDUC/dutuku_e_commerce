import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/search_screen/search_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_usecases.dart';

void main() {
  late MockSearchProductsUsecase usecase;
  late SearchProductsController controller;

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

  setUp(() {
    usecase = MockSearchProductsUsecase();
    controller = SearchProductsController(usecase);
  });

  tearDown(() => controller.close());

  blocTest<SearchProductsController, SearchProductsState>(
    'emits Initial when the keyword is empty',
    build: () => controller,
    act: (c) => c.search(''),
    expect: () => [SearchProductsInitial()],
    verify: (_) => verifyZeroInteractions(usecase),
  );

  blocTest<SearchProductsController, SearchProductsState>(
    'emits [Loading, Loaded] with matching products on success',
    setUp: () {
      when(
        () => usecase.call(SearchProductsFilterParams.init(keyword: 'margaux')),
      ).thenAnswer(
        (_) async => const Right(
          ProductsData(
            items: [tProduct],
            totalPage: 1,
            currentPage: 1,
            totalRecord: 1,
          ),
        ),
      );
    },
    build: () => controller,
    act: (c) => c.search('margaux'),
    expect: () => [
      SearchProductsLoadingState(),
      const SearchProductsLoadedState(products: [tProduct]),
    ],
  );

  blocTest<SearchProductsController, SearchProductsState>(
    'emits [Loading, Error] when the usecase fails',
    setUp: () {
      when(
        () => usecase.call(SearchProductsFilterParams.init(keyword: 'margaux')),
      ).thenAnswer((_) async => Left(ServerFailure()));
    },
    build: () => controller,
    act: (c) => c.search('margaux'),
    expect: () => [
      SearchProductsLoadingState(),
      const SearchProductsErrorState(errorMsg: 'something wrong'),
    ],
  );
}
