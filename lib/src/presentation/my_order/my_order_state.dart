part of 'my_order_controller.dart';

sealed class MyOrderState extends Equatable {
  const MyOrderState();

  @override
  List<Object> get props => [];
}

class MyOrderStateInitial extends MyOrderState {}
