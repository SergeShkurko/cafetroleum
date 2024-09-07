import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/data/order/data_sources/local/tables/order_item_local_model.dart';
import 'package:cafetroleum/src/data/order/data_sources/local/tables/order_local_model.dart';
import 'package:cafetroleum/src/data/product/data_sources/local/tables/product_local_model.dart';
import 'package:cafetroleum/src/data/space/data_sources/local/tables/room_local_model.dart';
import 'package:cafetroleum/src/data/space/data_sources/local/tables/table_local_model.dart';
import 'package:cafetroleum/src/domain/order/entities/order_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

@singleton
@DriftDatabase(
  tables: [Products, Rooms, Tables, Orders, OrderItems],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(AppPaths paths) : super(_openConnection(paths));

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(AppPaths paths) {
  return LazyDatabase(() async {
    return NativeDatabase.createInBackground(paths.dbFile);
  });
}
