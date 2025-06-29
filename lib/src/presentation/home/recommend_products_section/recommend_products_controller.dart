import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recommend_products_state.dart';

@injectable
class RecommendProductsController extends Cubit<RecommendProductsState> {
  final GetRecommendProductUsecase _getRecommendProductUsecase;

  RecommendProductsController(this._getRecommendProductUsecase)
    : super(RecommendProductsLoading());

  Future<void> getData() async {
    emit(RecommendProductsLoading());

    final result = await _getRecommendProductUsecase.call(NoParams());

    result.fold(
      (failure) {
        // TODO: handle fail
      },
      (r) {
        emit(RecommendProductsLoaded(r));
      },
    );
  }
}
