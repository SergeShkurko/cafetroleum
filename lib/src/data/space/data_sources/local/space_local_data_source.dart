import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/core/database/database.dart';
import 'package:cafetroleum/src/data/space/data_sources/local/mappers/space_local_mapper.dart';
import 'package:cafetroleum/src/domain/space/entities/room_entity.dart';
import 'package:cafetroleum/src/domain/space/entities/table_entity.dart';

abstract interface class SpaceLocalDataSource {
  TaskWithFailure<Iterable<RoomEntity>> fetch();
  TaskWithFailure<void> save(Iterable<RoomEntity> spaces);
}

@Injectable(as: SpaceLocalDataSource)
class SpaceLocalDataSourceImpl implements SpaceLocalDataSource {
  final AppDatabase _db;

  SpaceLocalDataSourceImpl(this._db);

  @override
  TaskWithFailure<Iterable<RoomEntity>> fetch() =>
      TaskWithFailure.Do((_) async {
        final rooms = await _(TaskEither.tryCatch(
          _db.select(_db.rooms).get,
          (_, __) => CacheFailure(),
        ));

        final tables = await _(TaskEither.tryCatch(
          _db.select(_db.tables).get,
          (_, __) => CacheFailure(),
        ));

        // sort by room id / table
        final tablesByRoomId =
            tables.fold(<String, List<TableLocalModel>>{}, (acc, next) {
          (acc[next.room] ??= []).add(next);
          return acc;
        });

        return rooms.map(
          (e) => SpaceLocalMapper.roomToEntity(e, tablesByRoomId[e.id]!),
        );
      });

  @override
  TaskWithFailure<void> save(Iterable<RoomEntity> rooms) => TaskEither.tryCatch(
        () => _db.batch((batch) {
          batch.insertAllOnConflictUpdate(
            _db.rooms,
            rooms.map(SpaceLocalMapper.roomToInsertCompanion),
          );

          final allTables = rooms
              .fold(<TableEntity>[], (acc, next) => acc..addAll(next.tables));

          batch.insertAllOnConflictUpdate(
            _db.tables,
            allTables.map(SpaceLocalMapper.tableToInsertCompanion),
          );
        }),
        (_, __) => CacheFailure(),
      );
}
