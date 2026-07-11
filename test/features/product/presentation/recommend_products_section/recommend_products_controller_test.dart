import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/recommend_products_section/recommend_products_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_usecases.dart';

void main() {
  late MockGetRecommendProductUsecase usecase;
  late RecommendProductsController controller;

  const tProductPage1 = ProductEntity(
    id: '1',
    name: 'Margaux Leather',
    brand: 'Handbag',
    price: 195.0,
    imageUrl: 'assets/images/product/p1_1.png',
    purchaserCount: 120,
    reviewComments: [],
    averageRating: 4.5,
  );

  const tProductPage2 = ProductEntity(
    id: '2',
    name: 'Vancouver Crossbody',
    brand: 'Bag',
    price: 143.45,
    imageUrl: 'assets/images/product/p2_2.png',
    purchaserCount: 85,
    reviewComments: [],
    averageRating: 4.2,
  );

  setUp(() {
    usecase = MockGetRecommendProductUsecase();
    controller = RecommendProductsController(usecase);
  });

  tearDown(() => controller.close());

  blocTest<RecommendProductsController, RecommendProductsState>(
    'emits [Loading, Loaded] with canLoadMore true when more pages remain',
    setUp: () {
      when(
        () => usecase.call(GetRecommendProjectFilterParams.init()),
      ).thenAnswer(
        (_) async => const Right(
          RecommendProductsData(
            items: [tProductPage1],
            totalPage: 2,
            currentPage: 1,
            totalRecord: 12,
          ),
        ),
      );
    },
    build: () => controller,
    act: (c) => c.onRefresh(),
    expect: () => [
      RecommendProductsLoadingState(),
      const RecommendProductsLoadedState(
        products: [tProductPage1],
        currentPage: 1,
        canLoadMore: true,
      ),
    ],
  );

  blocTest<RecommendProductsController, RecommendProductsState>(
    'emits [Loading, Error] when the usecase fails',
    setUp: () {
      when(
        () => usecase.call(GetRecommendProjectFilterParams.init()),
      ).thenAnswer((_) async => Left(ServerFailure()));
    },
    build: () => controller,
    act: (c) => c.onRefresh(),
    expect: () => [
      RecommendProductsLoadingState(),
      const RecommendProductsErrorState(errorMsg: 'something wrong'),
    ],
  );

  blocTest<RecommendProductsController, RecommendProductsState>(
    'onLoadMore appends the next page to the existing products',
    setUp: () {
      when(
        () => usecase.call(GetRecommendProjectFilterParams.init()),
      ).thenAnswer(
        (_) async => const Right(
          RecommendProductsData(
            items: [tProductPage1],
            totalPage: 2,
            currentPage: 1,
            totalRecord: 12,
          ),
        ),
      );
      when(
        () => usecase.call(
          GetRecommendProjectFilterParams.init().copyWith(pageNumber: 2),
        ),
      ).thenAnswer(
        (_) async => const Right(
          RecommendProductsData(
            items: [tProductPage2],
            totalPage: 2,
            currentPage: 2,
            totalRecord: 12,
          ),
        ),
      );
    },
    build: () => controller,
    act: (c) async {
      await c.onRefresh();
      await c.onLoadMore();
    },
    expect: () => [
      RecommendProductsLoadingState(),
      const RecommendProductsLoadedState(
        products: [tProductPage1],
        currentPage: 1,
        canLoadMore: true,
      ),
      const RecommendProductsLoadingLoadMoreState(products: [tProductPage1]),
      const RecommendProductsLoadedState(
        products: [tProductPage1, tProductPage2],
        currentPage: 2,
        canLoadMore: false,
      ),
    ],
  );

  blocTest<RecommendProductsController, RecommendProductsState>(
    'onLoadMore does nothing when there are no more pages',
    setUp: () {
      when(
        () => usecase.call(GetRecommendProjectFilterParams.init()),
      ).thenAnswer(
        (_) async => const Right(
          RecommendProductsData(
            items: [tProductPage1],
            totalPage: 1,
            currentPage: 1,
            totalRecord: 1,
          ),
        ),
      );
    },
    build: () => controller,
    act: (c) async {
      await c.onRefresh();
      await c.onLoadMore();
    },
    expect: () => [
      RecommendProductsLoadingState(),
      const RecommendProductsLoadedState(
        products: [tProductPage1],
        currentPage: 1,
        canLoadMore: false,
      ),
    ],
    verify: (_) {
      verify(
        () => usecase.call(GetRecommendProjectFilterParams.init()),
      ).called(1);
      verifyNoMoreInteractions(usecase);
    },
  );

  blocTest<RecommendProductsController, RecommendProductsState>(
    'onLoadMore is a no-op before any data has been loaded',
    build: () => controller,
    act: (c) => c.onLoadMore(),
    expect: () => [],
    verify: (_) => verifyZeroInteractions(usecase),
  );
}
