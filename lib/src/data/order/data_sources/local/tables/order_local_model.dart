import 'package:cafetroleum/src/domain/order/entities/order_entity.dart';
import 'package:drift/drift.dart';

@DataClassName('OrderLocalModel')
class Orders extends Table {
  @override
  String get tableName => 'orders';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get tableId => text()();
  IntColumn get persons => integer()();

  IntColumn get status => intEnum<OrderStatus>()();
}
