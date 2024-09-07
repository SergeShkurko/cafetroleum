import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/order/entities/order_item_entity.dart';
import 'package:cafetroleum/src/domain/order/repositories/order_repository.dart';
import 'package:freezed/freezed.dart';

@injectable
class RemoveOrderItemUsecase
    implements
        UseCase<TaskWithFailure<OrderItemEntity>, RemoveOrderItemParams> {
  RemoveOrderItemUsecase(this._repo);

  final OrderRepository _repo;

  @override
  TaskWithFailure<OrderItemEntity> call(RemoveOrderItemParams params) =>
      _repo.removeItem(params);
}

@Freezed()
class RemoveOrderItemParams {
  final String orderItemId;
}
