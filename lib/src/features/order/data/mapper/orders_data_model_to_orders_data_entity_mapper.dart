import 'package:dutuku_e_commerce/src/features/order/data/mapper/order_model_to_order_entity_mapper.dart';
import 'package:dutuku_e_commerce/src/features/order/data/models/orders_data_model.dart';
import 'package:dutuku_e_commerce/src/features/order/domain/entities/orders_data.dart';

class OrdersDataModelToOrdersDataEntityMapper {
  const OrdersDataModelToOrdersDataEntityMapper._();

  static OrdersData toEntity(OrdersDataModel model) {
    return OrdersData(
      items:
          model.items?.map(OrderModelToOrderEntityMapper.toEntity).toList() ??
          [],
      totalPage: model.totalPage ?? 0,
      currentPage: model.currentPage ?? 0,
      totalRecord: model.totalRecord ?? 0,
    );
  }
}
