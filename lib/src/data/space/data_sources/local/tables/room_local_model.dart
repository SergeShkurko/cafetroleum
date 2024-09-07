import 'package:drift/drift.dart';

@DataClassName('RoomLocalModel')
class Rooms extends Table {
  @override
  String get tableName => 'rooms';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get name => text()();
}
