import 'package:dutuku_e_commerce/src/features/order/data/models/order_model.dart';

class OrdersDataModel {
  final List<OrderModel>? items;
  final int? totalPage;
  final int? currentPage;
  final int? totalRecord;

  const OrdersDataModel({
    this.items,
    this.totalPage,
    this.currentPage,
    this.totalRecord,
  });
}
