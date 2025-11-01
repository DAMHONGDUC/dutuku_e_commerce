part of 'my_order_controller.dart';

sealed class MyOrderState extends Equatable {
  const MyOrderState({required this.currentTab});
  final OrderStatus currentTab;

  @override
  List<Object> get props => [currentTab];
}

class MyOrderStateInitial extends MyOrderState {
  const MyOrderStateInitial({
    super.currentTab = OrderStatus.waitingForConfirmation,
  });
}

final class MyOrderTransitState extends MyOrderState {
  const MyOrderTransitState({required super.currentTab});
}

final class MyOrderLoadingMoreState extends MyOrderState {
  const MyOrderLoadingMoreState({required super.currentTab});
}

final class MyOrderLoadingState extends MyOrderState {
  const MyOrderLoadingState({required super.currentTab});
}

final class MyOrderLoadedState extends MyOrderState {
  final List<OrderEntity> items;
  final bool canLoadMore;
  final int currentPage;

  const MyOrderLoadedState({
    required this.items,
    required this.canLoadMore,
    required this.currentPage,
    required super.currentTab,
  });

  @override
  List<Object> get props => [items, canLoadMore, currentTab, currentPage];
}

final class MyOrderRefreshCurrentLoadingState extends MyOrderState {
  const MyOrderRefreshCurrentLoadingState({required super.currentTab});
}

final class MyOrderErrorState extends MyOrderState {
  final String errorMsg;
  const MyOrderErrorState({required super.currentTab, required this.errorMsg});
}
