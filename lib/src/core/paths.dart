import 'dart:io';

import 'package:cafetroleum/src/core/core.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@lazySingleton
class AppPaths {
  const AppPaths._({
    required this.appDocuments,
    required this.appCache,
    required this.appStoredData,
    required this.dbFile,
  });

  final Directory appDocuments;
  final Directory appCache;

  /// Sub folder in appDocuments for store preferences, databases etc.
  final String appStoredData;
  final File dbFile;

  static const storedDataFolderName = 'data';
  static const dbFilename = 'db.sqlite';

  @FactoryMethod(preResolve: true)
  static Future<AppPaths> create(Logger logger) async {
    final appDocuments = await getApplicationDocumentsDirectory();
    final storeDataPath = p.join(appDocuments.path, storedDataFolderName);
    final dbFile = File(p.join(storeDataPath, dbFilename));

    logger.debug('DB file path: ${dbFile.path}');

    return AppPaths._(
      appDocuments: appDocuments,
      appCache: await getApplicationCacheDirectory(),
      appStoredData: storeDataPath,
      dbFile: dbFile,
    );
  }
}
