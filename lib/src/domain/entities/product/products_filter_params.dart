import 'package:equatable/equatable.dart';

class ProductsFilterParams extends Equatable {
  final int page;
  final int itemCount;
  final bool getRecommendProject;

  const ProductsFilterParams({
    required this.page,
    required this.itemCount,
    required this.getRecommendProject,
  });

  factory ProductsFilterParams.init() => const ProductsFilterParams(
    page: 1,
    itemCount: 10,
    getRecommendProject: false,
  );

  ProductsFilterParams copyWith({
    int? page,
    int? itemCount,
    bool? getRecommendProject,
  }) {
    return ProductsFilterParams(
      page: page ?? this.page,
      itemCount: itemCount ?? this.itemCount,
      getRecommendProject: getRecommendProject ?? this.getRecommendProject,
    );
  }

  @override
  List<Object> get props => [page, itemCount, getRecommendProject];
}
