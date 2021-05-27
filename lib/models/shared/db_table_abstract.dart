import 'package:sqflite/sqflite.dart';

abstract class DbTableAbstract {
  String get tableName;
  String get idColumn;

  Future<void> createTable(Database db);
}
