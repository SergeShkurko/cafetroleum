import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/space/entities/room_entity.dart';
import 'package:cafetroleum/src/domain/space/entities/table_entity.dart';

abstract interface class SpaceMockDataSource {
  TaskWithFailure<Iterable<RoomEntity>> fetch();
}

/// Внимание! id столов должны быть уникальными!
@Injectable(as: SpaceMockDataSource)
class SpaceMockDataSourceImpl implements SpaceMockDataSource {
  @override
  TaskWithFailure<Iterable<RoomEntity>> fetch() {
    return TaskEither.right([
      RoomEntity(id: '1', name: 'Левое крыло', tables: [
        TableEntity(id: '1', seats: 4, roomId: '1'),
        TableEntity(id: '2', seats: 4, roomId: '1'),
        TableEntity(id: '3', seats: 4, roomId: '1'),
        TableEntity(id: '4', seats: 4, roomId: '1'),
        TableEntity(id: '5', seats: 4, roomId: '1'),
        TableEntity(id: '6', seats: 4, roomId: '1'),
        TableEntity(id: '7', seats: 4, roomId: '1'),
        TableEntity(id: '8', seats: 4, roomId: '1'),
        TableEntity(id: '9', seats: 4, roomId: '1'),
        TableEntity(id: '10', seats: 4, roomId: '1'),
      ]),
      RoomEntity(id: '2', name: 'Правое крыло', tables: [
        TableEntity(id: '11', seats: 4, roomId: '2'),
        TableEntity(id: '12', seats: 4, roomId: '2'),
        TableEntity(id: '13', seats: 4, roomId: '2'),
        TableEntity(id: '14', seats: 4, roomId: '2'),
        TableEntity(id: '15', seats: 4, roomId: '2'),
        TableEntity(id: '16', seats: 4, roomId: '2'),
        TableEntity(id: '17', seats: 4, roomId: '2'),
        TableEntity(id: '18', seats: 4, roomId: '2'),
        TableEntity(id: '19', seats: 4, roomId: '2'),
        TableEntity(id: '20', seats: 4, roomId: '2'),
      ]),
    ]);
  }
}
