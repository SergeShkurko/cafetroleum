import 'package:drift/drift.dart';

@DataClassName('ProductLocalModel')
class Products extends Table {
  @override
  String get tableName => 'products';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get price => real()();
}
