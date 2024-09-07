import 'package:cafetroleum/src/data/space/data_sources/local/tables/room_local_model.dart';
import 'package:drift/drift.dart';

@DataClassName('TableLocalModel')
class Tables extends Table {
  @override
  String get tableName => 'tables';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  IntColumn get seats => integer()();
  TextColumn get room => text().references(Rooms, #id)();
}
