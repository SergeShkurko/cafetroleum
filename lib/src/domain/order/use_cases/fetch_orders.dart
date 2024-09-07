import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/order/entities/order_entity.dart';
import 'package:cafetroleum/src/domain/order/repositories/order_repository.dart';
import 'package:freezed/freezed.dart';

@injectable
class FetchProductsUsecase
    implements
        UseCase<TaskWithFailure<Iterable<OrderEntity>>, FetchProductsParams> {
  FetchProductsUsecase(this._repo);

  final OrderRepository _repo;

  @override
  TaskWithFailure<Iterable<OrderEntity>> call(FetchProductsParams params) =>
      _repo.fetchAll(params);
}

@Freezed()
class FetchProductsParams {
  final OrderStatus status;
}
