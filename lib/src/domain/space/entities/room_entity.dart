import 'package:cafetroleum/src/domain/space/entities/table_entity.dart';
import 'package:freezed/freezed.dart';

@Freezed()
class RoomEntity {
  final String id;
  final String name;
  final Iterable<TableEntity> tables;
}
