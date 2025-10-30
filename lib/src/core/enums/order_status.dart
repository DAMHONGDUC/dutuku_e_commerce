enum OrderStatus {
  waitingForConfirmation,
  waitingForPickup,
  waitingForDelivery,
  delivered,
  rolledBack,
  cancelled,
  none,
}

extension OrderStatusExt on OrderStatus {
  static List<OrderStatus> get allStatus =>
      OrderStatus.values.where((e) => e != OrderStatus.none).toList();

  String get label {
    switch (this) {
      case OrderStatus.waitingForConfirmation:
        return 'Waiting for Confirmation';
      case OrderStatus.waitingForPickup:
        return 'Waiting for Pickup';
      case OrderStatus.waitingForDelivery:
        return 'Waiting for Delivery';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.rolledBack:
        return 'Rolled Back';
      case OrderStatus.cancelled:
        return 'Cancelled';
      case OrderStatus.none:
        return 'None';
    }
  }
}
