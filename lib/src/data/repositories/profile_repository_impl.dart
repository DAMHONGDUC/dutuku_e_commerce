import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:system_design_flutter/index.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl();

  @override
  Future<Either<Failure, List<SettingSectionEntity>>>
  getProfileSettings() async {
    // Mock logic for testing purposes
    await SdHelper.delayLoading();

    return Right(ProfileMock.listSettingSection);
  }
}
