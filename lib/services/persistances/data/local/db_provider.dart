
import 'package:path/path.dart';
import 'package:programmingebook/services/persistances/data/local/local_config.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDbProvider {

  static Database db;
  
  static Future<void> open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), DatabaseConfig.databaseName),
      onCreate: (db, version) {
        return _createDb(db);
      },
      version: DatabaseConfig.databaseVersion,
    );
  }

  static void _createDb(Database db) {
    DatabaseConfig.createTablesQueries
        .forEach((createTableQuery) async {
      await db.execute(createTableQuery);
    });
  }
  
  static Future<void> clear() async {
    await deleteDatabase(join(await getDatabasesPath(), DatabaseConfig.databaseName));
  }
}