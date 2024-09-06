import 'package:cafetroleum/src/core/base/usecase.dart';
import 'package:cafetroleum/src/domain/product/entities/product_entity.dart';

abstract interface class ProductRepository {
  TaskWithFailure<Iterable<ProductEntity>> fetchAll(
    NoParams params,
  );
}
