import 'package:equatable/equatable.dart';

class SearchProductsFilterParams extends Equatable {
  final String keyword;
  final int page;
  final int itemCount;

  const SearchProductsFilterParams({
    required this.keyword,
    required this.page,
    required this.itemCount,
  });

  factory SearchProductsFilterParams.init({String keyword = ''}) =>
      SearchProductsFilterParams(keyword: keyword, page: 1, itemCount: 10);

  SearchProductsFilterParams copyWith({
    String? keyword,
    int? page,
    int? itemCount,
  }) {
    return SearchProductsFilterParams(
      keyword: keyword ?? this.keyword,
      page: page ?? this.page,
      itemCount: itemCount ?? this.itemCount,
    );
  }

  @override
  List<Object> get props => [keyword, page, itemCount];
}
