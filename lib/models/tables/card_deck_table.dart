import 'package:one_study_mobile/models/shared/db_table.dart';
import 'package:sqflite/sqflite.dart';

import 'card_table.dart';
import 'deck_table.dart';

class CardDeckTable implements DbTable {
  CardDeckTable._privateConstructor();

  static final CardDeckTable _instance = CardDeckTable._privateConstructor();
  static CardDeckTable get instance => _instance;

  String tableName = "cards_decks";

  Future<void> createTable(Database db) async {
    var cardTable = CardTable.instance;
    var deckTable = DeckTable.instance;

    return await db.execute("""
      CREATE TABLE $tableName(
        FOREIGN KEY (${cardTable.idColumn}) REFERENCES ${cardTable.tableName} (${cardTable.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
        , FOREIGN KEY ($deckTable.idColumn}) REFERENCES $deckTable.tableName} ($deckTable.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    """);
  }
}
