import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/mock/profile_mock.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/models/setting_section_model.dart';
import 'package:system_design_flutter/index.dart';

abstract class ProfileRemoteDataSource {
  Future<List<SettingSectionModel>> getProfileSettings();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl();

  @override
  Future<List<SettingSectionModel>> getProfileSettings() async {
    try {
      await SdHelper.delayLoading();
      return ProfileMock.listSettingSection;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
