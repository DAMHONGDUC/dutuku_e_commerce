import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/category/domain/entities/category_entity.dart';
import 'package:dutuku_e_commerce/src/features/category/domain/repositories/category_repository.dart';

class GetCategoriesUsecase implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository repository;

  GetCategoriesUsecase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
