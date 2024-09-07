import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/order/entities/order_entity.dart';
import 'package:cafetroleum/src/domain/order/repositories/order_repository.dart';
import 'package:freezed/freezed.dart';

@injectable
class FinishOrderUsecase
    implements UseCase<TaskWithFailure<OrderEntity>, FinishOrderParams> {
  FinishOrderUsecase(this._repo);

  final OrderRepository _repo;

  @override
  TaskWithFailure<OrderEntity> call(FinishOrderParams params) =>
      _repo.finish(params);
}

@Freezed()
class FinishOrderParams {
  final String orderId;
}
