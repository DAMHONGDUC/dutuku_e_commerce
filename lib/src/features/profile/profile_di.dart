import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:dutuku_e_commerce/src/features/profile/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/profile/presentation/profile/profile_controller.dart';

class ProfileDi {
  static config() {
    getIt.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(),
    );

    getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(dataSource: getIt<ProfileRemoteDataSource>()),
    );

    getIt.registerLazySingleton<GetProfileSettingsUsecase>(
      () => GetProfileSettingsUsecase(getIt<ProfileRepository>()),
    );

    getIt.registerFactory<ProfileController>(
      () => ProfileController(getIt<GetProfileSettingsUsecase>()),
    );
  }
}
