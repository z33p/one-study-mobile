import 'package:sqflite/sqflite.dart';

abstract class DbTable {
  String get tableName;
  String get idColumn;

  Future<void> createTable(Database db);
}
