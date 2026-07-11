import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchProductsController extends Cubit<SearchProductsState> {
  SearchProductsController(this._searchProductsUsecase)
    : super(SearchProductsInitial());

  final SearchProductsUsecase _searchProductsUsecase;

  Future<void> search(String keyword) async {
    if (keyword.trim().isEmpty) {
      emit(SearchProductsInitial());
      return;
    }

    emit(SearchProductsLoadingState());

    final result = await _searchProductsUsecase.call(
      SearchProductsFilterParams.init(keyword: keyword),
    );

    result.fold(
      (failure) => emit(SearchProductsErrorState(errorMsg: 'something wrong')),
      (data) => emit(SearchProductsLoadedState(products: data.items)),
    );
  }
}
