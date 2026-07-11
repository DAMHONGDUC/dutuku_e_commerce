import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/mapper/setting_section_model_to_setting_section_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/profile/domain/domain.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl({required this.dataSource});

  final ProfileRemoteDataSource dataSource;

  @override
  Future<Either<Failure, List<SettingSectionEntity>>>
  getProfileSettings() async {
    try {
      final result = await dataSource.getProfileSettings();

      return Right(
        result
            .map(SettingSectionModelToSettingSectionEntityMapper.toEntity)
            .toList(),
      );
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
