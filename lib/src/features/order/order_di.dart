import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/features/order/data/data_sources/order_remote_data_source.dart';
import 'package:dutuku_e_commerce/src/features/order/data/repositories/order_repository_impl.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/domain.dart';
import 'package:dutuku_e_commerce/src/features/order/presentation/my_order/my_order_controller.dart';
import 'package:dutuku_e_commerce/src/features/order/presentation/my_order/my_order_detail/my_order_detail_controller.dart';

class OrderDi {
  static config() {
    getIt.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(),
    );

    getIt.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(dataSource: getIt<OrderRemoteDataSource>()),
    );

    getIt.registerLazySingleton<GetMyOrderUsecase>(
      () => GetMyOrderUsecase(getIt<OrderRepository>()),
    );
    getIt.registerLazySingleton<GetOrderDetailUsecase>(
      () => GetOrderDetailUsecase(getIt<OrderRepository>()),
    );

    getIt.registerFactory<MyOrderController>(
      () => MyOrderController(getIt<GetMyOrderUsecase>()),
    );
    getIt.registerFactory<MyOrderDetailController>(
      () => MyOrderDetailController(getIt<GetOrderDetailUsecase>()),
    );
  }
}
