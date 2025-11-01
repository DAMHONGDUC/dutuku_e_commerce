import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:system_design_flutter/index.dart';

class OrderRepositoryImpl implements OrderRepository {
  const OrderRepositoryImpl();
  // Singleton-like static cache — resets when the app restarts
  static final Map<OrderStatus, List<OrderEntity>> _cachedOrders = {};

  // Config: fixed number of mock records per status
  static const _mockCountPerStatus = {
    OrderStatus.waitingForConfirmation: 20,
    OrderStatus.waitingForPickup: 0,
    OrderStatus.waitingForDelivery: 7,
    OrderStatus.delivered: 32,
    OrderStatus.rolledBack: 5,
    OrderStatus.cancelled: 12,
  };

  @override
  Future<Either<Failure, OrdersData>> getMyOrder({
    required GetMyOrderFilterParams params,
  }) async {
    await SdHelper.delayLoading();

    // Initialize mock data if not already cached
    _initializeMockDataIfNeeded();

    // Get all mock orders for this status
    final List<OrderEntity> allOrders = _cachedOrders[params.status] ?? [];

    // Pagination logic
    final startIndex = (params.pageNumber - 1) * params.itemCount;
    final endIndex = startIndex + params.itemCount;
    final List<OrderEntity> paginatedItems = (startIndex < allOrders.length)
        ? allOrders.sublist(startIndex, endIndex.clamp(0, allOrders.length))
        : [];

    final totalRecords = allOrders.length;
    final totalPage = (totalRecords / params.itemCount).ceil();

    return Right(
      OrdersData(
        currentPage: params.pageNumber,
        totalPage: totalPage,
        items: paginatedItems,
        totalRecord: totalRecords,
      ),
    );
  }

  // Initialize once per app run
  void _initializeMockDataIfNeeded() {
    if (_cachedOrders.isNotEmpty) return;

    for (final entry in _mockCountPerStatus.entries) {
      final status = entry.key;
      final count = entry.value;

      _cachedOrders[status] = OrderMock.generateOrders(
        count: count,
      ).map((e) => e.copyWith(status: status)).toList();
    }
  }

  // Optional: to clear mock cache manually (e.g., for testing)
  static void clearMockCache() => _cachedOrders.clear();
}
