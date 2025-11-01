import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/banner_item.dart';
import 'package:dutuku_e_commerce/src/domain/repositories/banner_repository.dart';

class GetBannersUsecase implements UseCase<List<BannerItem>, NoParams> {
  final BannerRepository repository;

  GetBannersUsecase(this.repository);

  @override
  Future<Either<Failure, List<BannerItem>>> call(NoParams params) async {
    return await repository.getBanners();
  }
}
