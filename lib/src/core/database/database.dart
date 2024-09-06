import 'package:cafetroleum/src/core/core.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

@singleton
@DriftDatabase(
  tables: [ProductLocalModel],
  // daos: [PreferencesDao],
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
