import 'package:dutuku_e_commerce/src/core/core.dart';

class GetMyOrderFilterParams {
  final int pageNumber;
  final int itemCount;
  final OrderStatus status;

  const GetMyOrderFilterParams({
    required this.pageNumber,
    required this.itemCount,
    required this.status,
  });

  factory GetMyOrderFilterParams.init() => const GetMyOrderFilterParams(
    pageNumber: 1,
    itemCount: 10,
    status: OrderStatusExt.defaultFirstTab,
  );

  GetMyOrderFilterParams copyWith({
    int? pageNumber,
    int? itemCount,
    OrderStatus? status,
  }) {
    return GetMyOrderFilterParams(
      pageNumber: pageNumber ?? this.pageNumber,
      itemCount: itemCount ?? this.itemCount,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [pageNumber, itemCount, status];
}
