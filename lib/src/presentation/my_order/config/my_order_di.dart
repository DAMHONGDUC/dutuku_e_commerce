import 'package:dutuku_e_commerce/src/di/injector.dart';
import 'package:dutuku_e_commerce/src/domain/domain.dart';
import 'package:dutuku_e_commerce/src/presentation/my_order/my_order_controller.dart';

class MyOrderDi {
  static configureDependencies() {
    getIt.registerFactory<MyOrderController>(
      () => MyOrderController(getIt<GetMyOrderUsecase>()),
    );
  }
}
