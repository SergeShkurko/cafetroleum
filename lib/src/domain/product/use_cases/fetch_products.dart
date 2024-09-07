import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/product/repositories/product_repository.dart';

@injectable
class FetchProductsUsecase implements UseCase<TaskWithFailure<void>, NoParams> {
  FetchProductsUsecase(this._repo);

  final ProductRepository _repo;

  @override
  TaskWithFailure<void> call(NoParams params) => _repo.fetchAll(params);
}
