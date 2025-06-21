import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_grid_state.dart';

@injectable
class ProductGridController extends Cubit<ProductGridState> {
  final GetRecommendProductUsecase _getRecommendProductUsecase;

  ProductGridController(this._getRecommendProductUsecase)
    : super(ProductGridLoading());

  Future<void> fetchProducts() async {
    emit(ProductGridLoading());

    final result = await _getRecommendProductUsecase.call(NoParams());

    result.fold(
      (failure) {
        // TODO: handle fail
      },
      (r) {
        emit(ProductGridLoaded(r));
      },
    );
  }
}
