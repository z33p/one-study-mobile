import 'package:one_study_mobile/models/shared/db_table_abstract.dart';
import 'package:one_study_mobile/models/shared/entity_abstract.dart';
import 'package:sqflite/sqflite.dart';

class CardTable implements DbTableAbstract {
  CardTable._privateConstructor();

  static final CardTable _instance = CardTable._privateConstructor();
  static CardTable get instance => _instance;

  final String tableName = "cards";

  final String idColumn = "card_id";

  final String frontColumn = "front";
  final String backColumn = "back";

  final String scoreColumn = "score";

  @override
  Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $frontColumn TEXT
        , $backColumn TEXT

        , $scoreColumn REAL

        ${EntityAbstract.entityColumnsSql}
      )
    """);
  }
}
