import 'package:sqflite/sqflite.dart';

abstract class DbTable {
  String get tableName;

  Future<void> createTable(Database db);
}
