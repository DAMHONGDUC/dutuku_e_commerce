import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/category/data/mapper/category_model_to_category_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/category/domain/domain.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl({required this.dataSource});

  final CategoryRemoteDataSource dataSource;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await dataSource.getCategories();

      return Right(
        result
            .map((e) => CategoryModelToCategoryEntityMapper.toEntity(e))
            .toList(),
      );
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
