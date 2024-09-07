import 'package:cafetroleum/src/core/base/usecase.dart';
import 'package:cafetroleum/src/domain/order/entities/order_entity.dart';
import 'package:cafetroleum/src/domain/order/entities/order_item_entity.dart';
import 'package:cafetroleum/src/domain/order/use_cases/add_order_item.dart';
import 'package:cafetroleum/src/domain/order/use_cases/change_order_items_count.dart';
import 'package:cafetroleum/src/domain/order/use_cases/fetch_orders.dart';
import 'package:cafetroleum/src/domain/order/use_cases/finish_order.dart';
import 'package:cafetroleum/src/domain/order/use_cases/remove_order_item.dart';

abstract interface class OrderRepository {
  TaskWithFailure<Iterable<OrderEntity>> fetchAll(FetchProductsParams params);

  TaskWithFailure<OrderItemEntity> addItem(AddOrderItemParams params);

  TaskWithFailure<OrderItemEntity> changeItemsCount(
      ChangeOrderItemsCountParams params);

  TaskWithFailure<OrderItemEntity> removeItem(RemoveOrderItemParams params);

  TaskWithFailure<OrderEntity> finish(FinishOrderParams params);
}
