import 'package:one_study_mobile/models/shared/db_table.dart';
import 'package:one_study_mobile/models/shared/entity.dart';
import 'package:sqflite/sqflite.dart';

class CardTable implements DbTable {
  CardTable._privateConstructor();

  static final CardTable _instance = CardTable._privateConstructor();
  static CardTable get instance => _instance;

  final String tableName = "cards";

  final String idColumn = "card_id";
  final String frontColumn = "front";
  final String backColumn = "back";

  @override
  Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $frontColumn TEXT
        , $backColumn TEXT
        ${Entity.entityColumnsSql}
      )
    """);
  }
}
