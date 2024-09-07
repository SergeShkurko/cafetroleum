import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/core/database/database.dart';
import 'package:cafetroleum/src/data/order/data_sources/local/mappers/order_local_mapper.dart';
import 'package:cafetroleum/src/domain/order/entities/order_entity.dart';

abstract interface class OrderLocalDataSource {
  TaskWithFailure<Iterable<OrderEntity>> fetch();
  // TaskWithFailure<void> save(Iterable<RoomEntity> spaces);
}

@Injectable(as: OrderLocalDataSource)
class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  final AppDatabase _db;

  OrderLocalDataSourceImpl(this._db);

  @override
  TaskWithFailure<Iterable<OrderEntity>> fetch() =>
      TaskWithFailure.Do((_) async {
        final orders = await _(TaskEither.tryCatch(
          _db.select(_db.orders).get,
          (_, __) => CacheFailure(),
        ));

        final orderItems = await _(TaskEither.tryCatch(
          _db.select(_db.orderItems).get,
          (_, __) => CacheFailure(),
        ));

        // sort by room id / table
        final itemsByOrderId =
            orderItems.fold(<String, List<OrderItemLocalModel>>{}, (acc, next) {
          (acc[next.orderId] ??= []).add(next);
          return acc;
        });

        return orders.map(
          (e) => OrderLocalMapper.roomToEntity(e, itemsByOrderId[e.id]!),
        );
      });

  // @override
  // TaskWithFailure<void> save(Iterable<RoomEntity> rooms) => TaskEither.tryCatch(
  //       () => _db.batch((batch) {
  //         batch.insertAllOnConflictUpdate(
  //           _db.rooms,
  //           rooms.map(OrderLocalMapper.roomToInsertCompanion),
  //         );

  //         final allTables = rooms
  //             .fold(<TableEntity>[], (acc, next) => acc..addAll(next.tables));

  //         batch.insertAllOnConflictUpdate(
  //           _db.tables,
  //           allTables.map(OrderLocalMapper.tableToInsertCompanion),
  //         );
  //       }),
  //       (_, __) => CacheFailure(),
  //     );
}
