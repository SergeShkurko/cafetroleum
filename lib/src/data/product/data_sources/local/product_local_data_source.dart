import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/core/database/database.dart';
import 'package:cafetroleum/src/data/product/data_sources/local/mappers/product_local_mapper.dart';
import 'package:cafetroleum/src/domain/product/entities/product_entity.dart';

abstract interface class ProductLocalDataSource {
  TaskWithFailure<Iterable<ProductEntity>> fetch();
  TaskWithFailure<void> save(Iterable<ProductEntity> products);
}

@Injectable(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final AppDatabase _db;

  ProductLocalDataSourceImpl(this._db);

  @override
  TaskWithFailure<Iterable<ProductEntity>> fetch() => TaskEither.tryCatch(
        _db.select(_db.products).get,
        (_, __) => CacheFailure(),
      ).map((products) => products.map(ProductLocalMapper.toEntity));

  @override
  TaskWithFailure<void> save(Iterable<ProductEntity> products) =>
      TaskEither.tryCatch(
        () => _db.batch((batch) {
          batch.insertAllOnConflictUpdate(
            _db.products,
            products.map(ProductLocalMapper.toInsertCompanion),
          );
        }),
        (_, __) => CacheFailure(),
      );
}
