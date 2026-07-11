import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/entities/recommend_products_data.dart';
import 'package:dutuku_e_commerce/src/features/product/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class GetRecommendProductUsecase
    implements UseCase<RecommendProductsData, GetRecommendProjectFilterParams> {
  final ProductRepository repository;

  GetRecommendProductUsecase(this.repository);

  @override
  Future<Either<Failure, RecommendProductsData>> call(
    GetRecommendProjectFilterParams params,
  ) async {
    return await repository.getRecommendProducts(params: params);
  }
}

class GetRecommendProjectFilterParams extends Equatable {
  final int pageNumber;
  final int itemCount;
  final OrderStatus status;

  const GetRecommendProjectFilterParams({
    required this.pageNumber,
    required this.itemCount,
    required this.status,
  });

  factory GetRecommendProjectFilterParams.init() =>
      const GetRecommendProjectFilterParams(
        pageNumber: 1,
        itemCount: 10,
        status: OrderStatusExt.defaultFirstTab,
      );

  GetRecommendProjectFilterParams copyWith({
    int? pageNumber,
    int? itemCount,
    OrderStatus? status,
  }) {
    return GetRecommendProjectFilterParams(
      pageNumber: pageNumber ?? this.pageNumber,
      itemCount: itemCount ?? this.itemCount,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [pageNumber, itemCount, status];
}
