import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/data/product/data_sources/local/product_local_data_source.dart';
import 'package:cafetroleum/src/data/product/data_sources/product_mock_data_source.dart';
import 'package:cafetroleum/src/domain/product/entities/product_entity.dart';
import 'package:cafetroleum/src/domain/product/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource local;
  final ProductMockDataSource mock;

  const ProductRepositoryImpl({required this.local, required this.mock});

  @override
  TaskWithFailure<Iterable<ProductEntity>> fetchAll(NoParams params) =>
      TaskWithFailure<Iterable<ProductEntity>>.Do((_) async {
        final products = await _(mock.fetch());

        await _(local.save(products));

        return products;
      }).orElse((error) => local.fetch());
}
