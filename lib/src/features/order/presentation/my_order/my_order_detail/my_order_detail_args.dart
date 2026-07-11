class MyOrderDetailArgs {
  final String orderId;

  MyOrderDetailArgs({required this.orderId});

  Map<String, dynamic> toJson() => {'orderId': orderId};

  factory MyOrderDetailArgs.fromJson(Map<String, dynamic> json) =>
      MyOrderDetailArgs(orderId: json['orderId']);
}
