import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/banner/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockBannerRepository repository;
  late GetBannersUsecase usecase;

  setUp(() {
    repository = MockBannerRepository();
    usecase = GetBannersUsecase(repository);
  });

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

  test('should return banners from the repository on success', () async {
    when(
      () => repository.getBanners(),
    ).thenAnswer((_) async => const Right(tBanners));

    final result = await usecase.call(NoParams());

    expect(result, const Right(tBanners));
    verify(() => repository.getBanners()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a Failure when the repository fails', () async {
    final failure = ServerFailure();
    when(() => repository.getBanners()).thenAnswer((_) async => Left(failure));

    final result = await usecase.call(NoParams());

    expect(result, Left(failure));
  });
}
