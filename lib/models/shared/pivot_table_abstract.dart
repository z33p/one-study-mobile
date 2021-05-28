import 'package:one_study_mobile/models/shared/db_table_abstract.dart';
import 'package:sqflite/sqflite.dart';

abstract class PivotTableAbstract {
  final DbTableAbstract leftTable;
  final DbTableAbstract rightTable;

  PivotTableAbstract({required this.leftTable, required this.rightTable});

  String get tableName => "${leftTable.tableName}_${rightTable.tableName}";

  Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        ${leftTable.idColumn} INTEGER
        , ${rightTable.idColumn} INTEGER

        , FOREIGN KEY (${leftTable.idColumn}) REFERENCES ${leftTable.tableName} (${leftTable.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
        , FOREIGN KEY (${rightTable.idColumn}) REFERENCES ${rightTable.tableName} (${rightTable.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    """);
  }
}
