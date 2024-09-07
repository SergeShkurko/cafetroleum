import 'package:cafetroleum/src/core/database/database.dart';
import 'package:cafetroleum/src/domain/order/entities/order_entity.dart';
import 'package:cafetroleum/src/domain/order/entities/order_item_entity.dart';

class OrderLocalMapper {
  static OrderEntity roomToEntity(
          OrderLocalModel m, Iterable<OrderItemLocalModel> r) =>
      OrderEntity(
          id: m.id,
          tableId: m.tableId,
          persons: m.persons,
          status: m.status,
          items: r.map(itemToEntity));

  static OrderItemEntity itemToEntity(OrderItemLocalModel m) => OrderItemEntity(
      id: m.id,
      orderId: m.orderId,
      productId: m.productId,
      quantity: m.quantity);

  // static OrdersCompanion roomToInsertCompanion(OrderEntity e) =>
  //     OrdersCompanion.insert(id: e.id, name: e.name);

  // static OrderItemsCompanion tableToInsertCompanion(OrderItemEntity e) =>
  //     OrderItemsCompanion.insert(id: e.id, seats: e.seats, room: e.roomId);
}
