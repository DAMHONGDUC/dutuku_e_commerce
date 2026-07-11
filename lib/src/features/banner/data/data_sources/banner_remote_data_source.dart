import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/banner/data/mock/banner_mock.dart';
import 'package:dutuku_e_commerce/src/features/banner/data/models/banner_model.dart';
import 'package:system_design_flutter/index.dart';

abstract class BannerRemoteDataSource {
  Future<List<BannerModel>> getBanners();
}

class BannerRemoteDataSourceImpl implements BannerRemoteDataSource {
  const BannerRemoteDataSourceImpl();

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      await SdHelper.delayLoading();
      return BannerMock.banners;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
