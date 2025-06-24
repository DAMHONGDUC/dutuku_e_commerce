import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUsecase implements UseCase<List<Category>, NoParams> {
  final ProductRepository repository;

  GetCategoriesUsecase(this.repository);

  @override
  Future<Either<ConfigFailure, List<Category>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
