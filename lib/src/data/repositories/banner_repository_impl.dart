import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:system_design_flutter/index.dart';

@Injectable(as: BannerRepository)
class BannerRepositoryImpl implements BannerRepository {
  const BannerRepositoryImpl();

  @override
  Future<Either<ConfigFailure, List<BannerItem>>> getBanners() async {
    await SdHelper.delayLoading();

    return Right(List.of(MockData.banners)..shuffle());
  }
}
