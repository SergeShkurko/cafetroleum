import 'package:cafetroleum/src/core/base/usecase.dart';
import 'package:cafetroleum/src/domain/space/entities/room_entity.dart';

abstract interface class SpaceRepository {
  TaskWithFailure<Iterable<RoomEntity>> fetchAll(
    NoParams params,
  );
}
