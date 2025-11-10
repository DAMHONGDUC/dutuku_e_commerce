import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

class GetProfileSettingsUsecase
    implements UseCase<List<SettingSectionEntity>, NoParams> {
  final ProfileRepository repository;

  GetProfileSettingsUsecase(this.repository);

  @override
  Future<Either<Failure, List<SettingSectionEntity>>> call(
    NoParams params,
  ) async {
    return await repository.getProfileSettings();
  }
}
