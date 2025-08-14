import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recommend_products_state.dart';

@injectable
class RecommendProductsController extends Cubit<RecommendProductsState> {
  final GetRecommendProductUsecase _getRecommendProductUsecase;

  RecommendProductsController(this._getRecommendProductUsecase)
    : super(RecommendProductsInitial());

  final ProductsFilterParams _filter = ProductsFilterParams.init().copyWith(
    getRecommendProject: true,
  );

  Future<void> onGetData() async {
    emit(RecommendProductsLoadingState());

    final result = await _getRecommendProductUsecase.call(_filter);

    result.fold(
      (failure) {
        emit(RecommendProductsErrorState(errorMsg: ''));
      },
      (r) {
        emit(RecommendProductsLoadedState(products: r.products));
      },
    );
  }
}
