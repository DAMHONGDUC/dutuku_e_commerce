import 'package:equatable/equatable.dart';

class SearchProductsFilterParams extends Equatable {
  final int page;
  final int itemCount;

  const SearchProductsFilterParams({
    required this.page,
    required this.itemCount,
  });

  factory SearchProductsFilterParams.init() =>
      const SearchProductsFilterParams(page: 1, itemCount: 10);

  SearchProductsFilterParams copyWith({
    int? page,
    int? itemCount,
    bool? getRecommendProject,
  }) {
    return SearchProductsFilterParams(
      page: page ?? this.page,
      itemCount: itemCount ?? this.itemCount,
    );
  }

  @override
  List<Object> get props => [page, itemCount];
}
