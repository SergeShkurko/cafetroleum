import 'package:cafetroleum/src/core/database/database.dart';
import 'package:cafetroleum/src/domain/space/entities/room_entity.dart';
import 'package:cafetroleum/src/domain/space/entities/table_entity.dart';

class SpaceLocalMapper {
  static RoomEntity roomToEntity(
          RoomLocalModel m, Iterable<TableLocalModel> r) =>
      RoomEntity(id: m.id, name: m.name, tables: r.map(tableToEntity));

  static TableEntity tableToEntity(TableLocalModel m) =>
      TableEntity(id: m.id, seats: m.seats, roomId: m.room);

  static RoomsCompanion roomToInsertCompanion(RoomEntity e) =>
      RoomsCompanion.insert(id: e.id, name: e.name);

  static TablesCompanion tableToInsertCompanion(TableEntity e) =>
      TablesCompanion.insert(id: e.id, seats: e.seats, room: e.roomId);
}
