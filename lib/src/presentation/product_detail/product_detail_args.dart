class ProductDetailArgs {
  final int productId;

  ProductDetailArgs({required this.productId});

  Map<String, dynamic> toJson() => {'productId': productId};

  factory ProductDetailArgs.fromJson(Map<String, dynamic> json) =>
      ProductDetailArgs(productId: json['productId']);
}
