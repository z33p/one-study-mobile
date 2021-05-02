import 'package:one_study_mobile/core/models/model.dart';
import 'package:sqflite/sqflite.dart';

class Card extends Model {
  int? cardId;

  final String front;
  final String back;

  Card(
      {required this.cardId,
      required this.front,
      required this.back,
      createdAt,
      updatedAt})
      : super(createdAt, updatedAt);

  Card.make({required this.front, required this.back}) : super.make();

  static String tableName = "cards";

  static String idColumn = "card_id";
  static String frontColumn = "front";
  static String backColumn = "back";

  static Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $frontColumn TEXT
        , $backColumn TEXT
        ${Model.createModelColumnsSql}
      )
    """);
  }

  static Card fromMap(Map<String, dynamic> cardMap) {
    var model = Model.fromMap(cardMap);

    var card = Card(
        cardId: cardMap[idColumn],
        front: cardMap[frontColumn],
        back: cardMap[backColumn],
        createdAt: model.createdAt,
        updatedAt: model.updatedAt);

    return card;
  }

  static List<Card> fromMapList(List<Map<String, dynamic>> cardsMap) {
    var cards = cardsMap.map((p) => fromMap(p)).toList();

    return cards;
  }

  Map<String, dynamic> toMap() {
    var cardMap = super.toMap();

    cardMap[frontColumn] = this.front;
    cardMap[backColumn] = this.back;

    return cardMap;
  }
}
