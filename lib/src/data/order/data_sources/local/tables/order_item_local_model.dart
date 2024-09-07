import 'package:drift/drift.dart';

@DataClassName('OrderItemLocalModel')
class OrderItems extends Table {
  @override
  String get tableName => 'order_items';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get orderId => text()();

  TextColumn get productId => text()();
  IntColumn get quantity => integer()();
}
