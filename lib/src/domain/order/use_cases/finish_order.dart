import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/order/entities/order_item_entity.dart';
import 'package:cafetroleum/src/domain/order/repositories/order_repository.dart';
import 'package:freezed/freezed.dart';

@injectable
class ChangeOrderItemsCountUsecase
    implements
        UseCase<TaskWithFailure<OrderItemEntity>, ChangeOrderItemsCountParams> {
  ChangeOrderItemsCountUsecase(this._repo);

  final OrderRepository _repo;

  @override
  TaskWithFailure<OrderItemEntity> call(ChangeOrderItemsCountParams params) =>
      _repo.changeItemsCount(params);
}

@Freezed()
class ChangeOrderItemsCountParams {
  final String orderItemId;
  final int count;
}
