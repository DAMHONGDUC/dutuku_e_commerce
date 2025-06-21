import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/entities/product.dart';
import 'package:dutuku_e_commerce/src/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecommendProductUsecase implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  GetRecommendProductUsecase(this.repository);

  @override
  Future<Either<ConfigFailure, List<Product>>> call(NoParams params) async {
    return await repository.getRecommendProducts();
  }
}
