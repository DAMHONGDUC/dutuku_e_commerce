import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/profile/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_repositories.dart';

void main() {
  late MockProfileRepository repository;
  late GetProfileSettingsUsecase usecase;

  setUp(() {
    repository = MockProfileRepository();
    usecase = GetProfileSettingsUsecase(repository);
  });

  final tSections = [
    SettingSectionEntity(
      name: 'Account',
      sectionType: SettingSectionType.general,
      items: const [],
    ),
  ];

  test(
    'should return profile settings from the repository on success',
    () async {
      when(
        () => repository.getProfileSettings(),
      ).thenAnswer((_) async => Right(tSections));

      final result = await usecase.call(NoParams());

      expect(result, Right(tSections));
      verify(() => repository.getProfileSettings()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test('should return a Failure when the repository fails', () async {
    final failure = ServerFailure();
    when(
      () => repository.getProfileSettings(),
    ).thenAnswer((_) async => Left(failure));

    final result = await usecase.call(NoParams());

    expect(result, Left(failure));
  });
}
