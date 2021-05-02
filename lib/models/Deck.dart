import 'package:one_study_mobile/core/models/model.dart';
import 'package:sqflite/sqflite.dart';

class Deck extends Model {
  int? deckId;

  final String title;
  final String description;

  Deck(
      {required this.deckId,
      required this.title,
      required this.description,
      createdAt,
      updatedAt})
      : super(createdAt, updatedAt);

  Deck.make({required this.title, required this.description}) : super.make();

  static String tableName = "decks";

  static String idColumn = "deck_id";
  static String titleColumn = "title";
  static String descriptionColumn = "description";

  static Future<void> createTable(Database db) async {
    return await db.execute("""
      CREATE TABLE $tableName(
        $idColumn INTEGER PRIMARY KEY
        , $titleColumn TEXT
        , $descriptionColumn TEXT
        ${Model.createModelColumnsSql}
      )
    """);
  }

  static Deck fromMap(Map<String, dynamic> deckMap) {
    var model = Model.fromMap(deckMap);

    var deck = Deck(
        deckId: deckMap[idColumn],
        title: deckMap[titleColumn],
        description: deckMap[descriptionColumn],
        createdAt: model.createdAt,
        updatedAt: model.updatedAt);

    return deck;
  }

  static List<Deck> fromMapList(List<Map<String, dynamic>> decksMap) {
    var decks = decksMap.map((p) => fromMap(p)).toList();

    return decks;
  }

  Map<String, dynamic> toMap() {
    var deckMap = super.toMap();

    deckMap[titleColumn] = this.title;
    deckMap[descriptionColumn] = this.description;

    return deckMap;
  }
}
