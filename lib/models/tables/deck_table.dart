import 'package:one_study/models/shared/db_table_abstract.dart';
import 'package:one_study/models/shared/entity_abstract.dart';
import 'package:sqflite/sqflite.dart';

class DeckTable implements DbTableAbstract {
  DeckTable._privateConstructor();

  static final DeckTable _instance = DeckTable._privateConstructor();
  static DeckTable get instance => _instance;

  final String tableName = "decks";

  final String idColumn = "deck_id";
  final String titleColumn = "title";
  final String descriptionColumn = "description";

  Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $titleColumn TEXT
        , $descriptionColumn TEXT
        ${EntityAbstract.entityColumnsSql}
      )
    """);
  }
}
