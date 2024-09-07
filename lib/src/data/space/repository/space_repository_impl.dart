import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/data/space/data_sources/local/space_local_data_source.dart';
import 'package:cafetroleum/src/data/space/data_sources/space_mock_data_source.dart';
import 'package:cafetroleum/src/domain/space/entities/room_entity.dart';
import 'package:cafetroleum/src/domain/space/repositories/space_repository.dart';

class SpaceRepositoryImpl implements SpaceRepository {
  final SpaceLocalDataSource local;
  final SpaceMockDataSource mock;

  const SpaceRepositoryImpl({required this.local, required this.mock});

  @override
  TaskWithFailure<Iterable<RoomEntity>> fetchAll(NoParams params) =>
      TaskWithFailure<Iterable<RoomEntity>>.Do((_) async {
        final spaces = await _(mock.fetch());

        await _(local.save(spaces));

        return spaces;
      }).orElse((error) => local.fetch());
}
