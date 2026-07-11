import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/models/setting_item_model.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/models/setting_section_model.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockProfileRemoteDataSource dataSource;
  late ProfileRepositoryImpl repository;

  setUp(() {
    dataSource = MockProfileRemoteDataSource();
    repository = ProfileRepositoryImpl(dataSource: dataSource);
  });

  const tSectionModels = [
    SettingSectionModel(
      name: 'General',
      sectionType: SettingSectionType.general,
      items: [
        SettingItemModel(
          name: 'Edit Profile',
          itemType: SettingItemType.editProfile,
        ),
      ],
    ),
  ];

  test('should map data source models to entities', () async {
    when(
      () => dataSource.getProfileSettings(),
    ).thenAnswer((_) async => tSectionModels);

    final result = await repository.getProfileSettings();

    result.fold((_) => fail('expected Right'), (sections) {
      expect(sections.length, 1);
      expect(sections.single.name, 'General');
      expect(sections.single.items.single.name, 'Edit Profile');
    });
  });

  test('should return a ServerFailure when the data source throws', () async {
    when(
      () => dataSource.getProfileSettings(),
    ).thenThrow(const ServerException());

    final result = await repository.getProfileSettings();

    expect(result, Left(ServerFailure()));
  });
}
