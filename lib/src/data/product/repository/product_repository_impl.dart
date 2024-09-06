import 'package:cafetroleum/src/core/base/usecase.dart';
import 'package:cafetroleum/src/data/product/data_sources/local/local_data_source.dart';
import 'package:cafetroleum/src/data/product/data_sources/mock_data_source.dart';
import 'package:cafetroleum/src/domain/product/entities/product_entity.dart';
import 'package:cafetroleum/src/domain/product/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final LocalProductDataSource local;
  final MockProductDataSource mock;

  const ProductRepositoryImpl({required this.local, required this.mock});

  @override
  TaskWithFailure<Iterable<ProductEntity>> fetchAll(
    NoParams params,
  ) =>
      mock.fetch().orElse((error) => local.fetch());
}
