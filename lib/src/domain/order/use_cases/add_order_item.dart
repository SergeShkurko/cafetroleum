import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/order/entities/order_item_entity.dart';
import 'package:cafetroleum/src/domain/order/repositories/order_repository.dart';
import 'package:freezed/freezed.dart';

@injectable
class AddOrderItemUsecase
    implements UseCase<TaskWithFailure<OrderItemEntity>, AddOrderItemParams> {
  AddOrderItemUsecase(this._repo);

  final OrderRepository _repo;

  @override
  TaskWithFailure<OrderItemEntity> call(AddOrderItemParams params) =>
      _repo.addItem(params);
}

@Freezed()
class AddOrderItemParams {
  final String orderId;
  final String productId;
}
