import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/product/presentation/product_detail/product_detail_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_usecases.dart';

void main() {
  late MockGetProductDetailUsecase usecase;
  late ProductDetailController controller;

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

  setUp(() {
    usecase = MockGetProductDetailUsecase();
    controller = ProductDetailController(usecase);
  });

  tearDown(() => controller.close());

  blocTest<ProductDetailController, ProductDetailState>(
    'emits [Loading, Loaded] when the usecase succeeds',
    setUp: () {
      when(
        () => usecase.call(tProductId),
      ).thenAnswer((_) async => const Right(tProduct));
    },
    build: () => controller,
    act: (c) => c.getProductDetail(productId: tProductId),
    expect: () => [
      ProductDetailLoadingState(),
      const ProductDetailLoadedState(product: tProduct),
    ],
  );

  blocTest<ProductDetailController, ProductDetailState>(
    'emits [Loading, Error] when the usecase fails',
    setUp: () {
      when(
        () => usecase.call(tProductId),
      ).thenAnswer((_) async => Left(ServerFailure()));
    },
    build: () => controller,
    act: (c) => c.getProductDetail(productId: tProductId),
    expect: () => [
      ProductDetailLoadingState(),
      const ProductDetailErrorState(errorMsg: 'something wrong'),
    ],
  );
}
