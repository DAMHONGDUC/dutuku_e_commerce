part of 'my_order_detail_controller.dart';

sealed class MyOrderDetailState extends Equatable {
  const MyOrderDetailState();

  @override
  List<Object> get props => [];
}

final class MyOrderDetailInitial extends MyOrderDetailState {}

final class MyOrderDetailLoadingState extends MyOrderDetailState {}

final class MyOrderDetailLoadedState extends MyOrderDetailState {
  final OrderEntity order;

  const MyOrderDetailLoadedState({required this.order});
}

final class MyOrderDetailErrorState extends MyOrderDetailState {
  final String errorMsg;

  const MyOrderDetailErrorState({required this.errorMsg});
}
