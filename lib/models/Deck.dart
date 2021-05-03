import 'package:one_study_mobile/models/shared/entity.dart';
import 'package:one_study_mobile/models/tables/deck_table.dart';

class Deck implements Entity {
  int? deckId;

  final String title;
  final String description;

  Deck({
    required this.deckId,
    required this.title,
    required this.description,
    this.createdAt,
    this.updatedAt,
  });

  Deck.make({required this.title, required this.description});

  final DeckTable dbTable = DeckTable.instance;

  static Deck fromMap(Map<String, dynamic> deckMap) {
    var deckTable = DeckTable.instance;

    var deck = Deck(
      deckId: deckMap[deckTable.idColumn],
      title: deckMap[deckTable.titleColumn],
      description: deckMap[deckTable.descriptionColumn],
      createdAt: DateTime.parse(deckMap[Entity.createdAtColumn]),
      updatedAt: DateTime.parse(deckMap[Entity.updatedAtColumn]),
    );

    return deck;
  }

  static List<Deck> fromMapList(List<Map<String, dynamic>> decksMap) {
    var decks = decksMap.map((p) => fromMap(p)).toList();

    return decks;
  }

  Map<String, dynamic> toMap() {
    var deckMap = Entity.entityToMap(this);

    deckMap[dbTable.titleColumn] = this.title;
    deckMap[dbTable.descriptionColumn] = this.description;

    return deckMap;
  }

  @override
  DateTime? createdAt;

  @override
  DateTime? updatedAt;
}
