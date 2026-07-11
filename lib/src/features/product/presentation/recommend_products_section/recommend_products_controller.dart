import 'package:dutuku_e_commerce/src/features/product/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recommend_products_state.dart';

class RecommendProductsController extends Cubit<RecommendProductsState> {
  final GetRecommendProductUsecase _getRecommendProductUsecase;

  GetRecommendProjectFilterParams _filterParams =
      GetRecommendProjectFilterParams.init();
  bool _isLoadingMore = false;

  RecommendProductsController(this._getRecommendProductUsecase)
    : super(RecommendProductsInitial());

  Future<void> onRefresh() async {
    _filterParams = GetRecommendProjectFilterParams.init();

    emit(RecommendProductsLoadingState());

    final result = await _getRecommendProductUsecase.call(_filterParams);

    result.fold(
      (failure) =>
          emit(RecommendProductsErrorState(errorMsg: 'something wrong')),
      (data) => emit(
        RecommendProductsLoadedState(
          products: data.items,
          currentPage: data.currentPage,
          canLoadMore: data.totalPage > data.currentPage,
        ),
      ),
    );
  }

  Future<void> onLoadMore() async {
    final currentState = state;

    if (_isLoadingMore ||
        currentState is! RecommendProductsLoadedState ||
        !currentState.canLoadMore) {
      return;
    }

    _isLoadingMore = true;

    final newFilterParams = _filterParams.copyWith(
      pageNumber: _filterParams.pageNumber + 1,
    );

    emit(
      RecommendProductsLoadingLoadMoreState(products: currentState.products),
    );

    final result = await _getRecommendProductUsecase.call(newFilterParams);

    result.fold((failure) => emit(currentState), (data) {
      _filterParams = newFilterParams;
      emit(
        RecommendProductsLoadedState(
          products: [...currentState.products, ...data.items],
          currentPage: data.currentPage,
          canLoadMore: data.totalPage > data.currentPage,
        ),
      );
    });

    _isLoadingMore = false;
  }
}
