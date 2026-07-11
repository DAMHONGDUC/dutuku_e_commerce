import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_order_detail_state.dart';

class MyOrderDetailController extends Cubit<MyOrderDetailState> {
  MyOrderDetailController(this._getOrderDetailUsecase)
    : super(MyOrderDetailInitial());

  final GetOrderDetailUsecase _getOrderDetailUsecase;

  Future<void> getOrderDetail({required String orderId}) async {
    emit(MyOrderDetailLoadingState());

    final result = await _getOrderDetailUsecase.call(orderId);

    result.fold(
      (failure) => emit(MyOrderDetailErrorState(errorMsg: 'something wrong')),
      (order) => emit(MyOrderDetailLoadedState(order: order)),
    );
  }
}
