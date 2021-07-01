import 'package:one_study/models/tables/card_deck_table.dart';
import 'package:one_study/models/tables/card_table.dart';
import 'package:one_study/models/tables/deck_table.dart';
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  
  static const String dbName = "personal_growth.db";
  static String dbPath = "";

  static late Database dbInstance;

  static Future<void> init() async {
    // deleteDbIfExists();
    if (dbPath.isEmpty) dbPath = join(await getDatabasesPath(), dbName);

    final database = openDatabase(dbPath,
        onConfigure: onConfigure, onCreate: onCreate, version: 1);

    dbInstance = await database;
  }

  static void onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static void onCreate(Database db, int version) async {
    await CardTable.instance.createTable(db);
    await DeckTable.instance.createTable(db);
    await CardDeckTable.instance.createTable(db);
  }

  static Future<void> deleteDbIfExists() async {
    if (dbPath.isEmpty) dbPath = join(await getDatabasesPath(), dbName);

    if (await databaseExists(dbPath)) await deleteDatabase(dbPath);
  }
}
