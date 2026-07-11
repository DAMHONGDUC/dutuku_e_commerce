import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/category/data/data_sources/category_remote_data_source_impl.dart';
import 'package:dutuku_e_commerce/src/features/category/data/repositories/category_repository_impl.dart';
import 'package:dutuku_e_commerce/src/features/category/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/category/presentation/categories_section/categories_section_controller.dart';

class CategoryDi {
  static config() {
    getIt.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(),
    );

    getIt.registerLazySingleton<CategoryRepository>(
      () =>
          CategoryRepositoryImpl(dataSource: getIt<CategoryRemoteDataSource>()),
    );

    getIt.registerLazySingleton<GetCategoriesUsecase>(
      () => GetCategoriesUsecase(getIt<CategoryRepository>()),
    );

    getIt.registerFactory<CategoriesController>(
      () => CategoriesController(getIt<GetCategoriesUsecase>()),
    );
  }
}
