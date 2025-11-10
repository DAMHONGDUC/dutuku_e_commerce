import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<SettingSectionEntity>>> getProfileSettings();
}
