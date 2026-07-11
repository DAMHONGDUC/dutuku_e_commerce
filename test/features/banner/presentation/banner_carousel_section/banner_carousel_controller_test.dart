import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/banner/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/banner/presentation/banner_carousel_section/banner_carousel_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_usecases.dart';

void main() {
  late MockGetBannersUsecase usecase;
  late BannerCarouselController controller;

  const tBanners = [
    BannerItem(
      imageUrl: 'assets/images/banner/b1.png',
      tag: 'Sale',
      tagType: BannerTagType.discount,
      title: 'Title',
      subtitle: 'Subtitle',
      price: '\$10',
      contentColor: '#FFFFFF',
      id: 1,
    ),
  ];

  setUp(() {
    usecase = MockGetBannersUsecase();
    controller = BannerCarouselController(usecase);
  });

  tearDown(() => controller.close());

  blocTest<BannerCarouselController, BannerCarouselState>(
    'emits [Loading, Success] when the usecase succeeds',
    setUp: () {
      when(
        () => usecase.call(NoParams()),
      ).thenAnswer((_) async => const Right(tBanners));
    },
    build: () => controller,
    act: (c) => c.getData(),
    expect: () => [
      BannerCarouselLoading(),
      const BannerCarouselSuccess(banners: tBanners),
    ],
  );

  blocTest<BannerCarouselController, BannerCarouselState>(
    'emits [Loading, Error] when the usecase fails',
    setUp: () {
      when(
        () => usecase.call(NoParams()),
      ).thenAnswer((_) async => Left(ServerFailure()));
    },
    build: () => controller,
    act: (c) => c.getData(),
    expect: () => [
      BannerCarouselLoading(),
      const BannerCarouselError(errorMsg: 'something wrong'),
    ],
  );
}
