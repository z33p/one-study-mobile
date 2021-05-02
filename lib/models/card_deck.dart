import 'package:sqflite/sqflite.dart';

import 'card.dart';
import 'deck.dart';

class CardDeck {
  late int cardId;
  late Card card;

  late int deckId;
  late Deck deck;

  static String tableName = "cards_decks";

  static Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        FOREIGN KEY (${Card.idColumn}) REFERENCES ${Card.tableName} (${Card.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
        , FOREIGN KEY (${Deck.idColumn}) REFERENCES ${Deck.tableName} (${Deck.idColumn}) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    """);
  }
}
