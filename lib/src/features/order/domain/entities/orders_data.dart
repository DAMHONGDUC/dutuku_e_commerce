import 'package:equatable/equatable.dart';

import 'order_entity.dart';

class OrdersData extends Equatable {
  final List<OrderEntity> items;
  final int totalPage;
  final int currentPage;
  final int totalRecord;

  const OrdersData({
    required this.items,
    required this.totalPage,
    required this.currentPage,
    required this.totalRecord,
  });

  @override
  List<Object?> get props => [items, totalPage, currentPage, totalRecord];
}
