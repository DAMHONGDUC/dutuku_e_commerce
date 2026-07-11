import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/banner/data/models/banner_model.dart';
import 'package:dutuku_e_commerce/src/features/banner/data/repositories/banner_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockBannerRemoteDataSource dataSource;
  late BannerRepositoryImpl repository;

  setUp(() {
    dataSource = MockBannerRemoteDataSource();
    repository = BannerRepositoryImpl(dataSource: dataSource);
  });

  const tBannerModels = [
    BannerModel(
      id: 1,
      imageUrl: 'assets/images/banner/b_1.png',
      tag: 'Sale',
      tagType: BannerTagType.discount,
      title: 'Title',
      subtitle: 'Subtitle',
      price: '\$10',
      contentColor: '#FFFFFF',
    ),
  ];

  test(
    'should map the models returned by the data source to entities',
    () async {
      when(
        () => dataSource.getBanners(),
      ).thenAnswer((_) async => tBannerModels);

      final result = await repository.getBanners();

      result.fold((_) => fail('expected Right'), (banners) {
        expect(banners.length, 1);
        expect(banners.single.id, 1);
        expect(banners.single.title, 'Title');
      });
    },
  );

  test('should return a ServerFailure when the data source throws', () async {
    when(() => dataSource.getBanners()).thenThrow(const ServerException());

    final result = await repository.getBanners();

    expect(result, Left(ServerFailure()));
  });
}
