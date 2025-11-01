import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_detail_state.dart';

class ProductDetailController extends Cubit<ProductDetailState> {
  ProductDetailController(this._getProductDetailUsecase)
    : super(ProductDetailInitial());

  final GetProductDetailUsecase _getProductDetailUsecase;

  Future getProductDetail({required String productId}) async {
    emit(ProductDetailLoadingState());

    final result = await _getProductDetailUsecase.call(productId);

    result.fold(
      (failure) {
        emit(ProductDetailErrorState(errorMsg: 'something wrong'));
      },
      (r) {
        emit(ProductDetailLoadedState(product: r));
      },
    );
  }
}
