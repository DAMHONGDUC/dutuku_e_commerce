import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/banner_item.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<BannerItem>>> getBanners();
}
