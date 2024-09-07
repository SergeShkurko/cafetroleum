import 'package:cafetroleum/src/domain/order/entities/order_item_entity.dart';
import 'package:freezed/freezed.dart';

@Freezed()
class OrderEntity {
  final String id;
  final String tableId;
  final int persons;
  final OrderStatus status;
  final Iterable<OrderItemEntity> items;
}

enum OrderStatus {
  processing,
  finished,
}
