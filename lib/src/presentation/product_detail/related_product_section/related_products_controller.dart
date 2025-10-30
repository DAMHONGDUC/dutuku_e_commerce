import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'related_products_state.dart';

@injectable
class RelatedProductsController extends Cubit<RelatedProductsState> {
  final GetRelatedProductUsecase _getRelatedProductUsecase;

  RelatedProductsController(this._getRelatedProductUsecase)
    : super(RelatedProductsInitial());

  Future<void> getData({required String productId}) async {
    emit(RelatedProductsLoadingState());

    final result = await _getRelatedProductUsecase.call(
      GetRelatedProductParams(productId: productId, limit: 6),
    );

    result.fold(
      (failure) {
        emit(RelatedProductsErrorState(errorMsg: ''));
      },
      (r) {
        emit(RelatedProductsLoadedState(products: r));
      },
    );
  }
}
