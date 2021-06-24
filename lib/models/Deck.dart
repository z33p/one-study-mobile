import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/models/shared/entity_abstract.dart';
import 'package:one_study_mobile/models/tables/deck_table.dart';

class Deck extends EntityAbstract {
  int? deckId;

  final String title;
  final String description;

  List<Card> cards = const <Card>[];

  Deck({
    required this.deckId,
    required this.title,
    required this.description,
    required createdAt,
    required updatedAt,
  }) : super(createdAt, updatedAt);

  Deck.make({
    required this.title,
    required this.description,
    this.cards = const <Card>[],
  }) : super.make();

  final DeckTable dbTable = DeckTable.instance;

  static Deck fromMap(Map<String, dynamic> deckMap) {
    var deckTable = DeckTable.instance;

    var deck = Deck(
      deckId: deckMap[deckTable.idColumn],
      title: deckMap[deckTable.titleColumn],
      description: deckMap[deckTable.descriptionColumn],
      createdAt: DateTime.parse(deckMap[EntityAbstract.createdAtColumn]),
      updatedAt: DateTime.parse(deckMap[EntityAbstract.updatedAtColumn]),
    );

    return deck;
  }

  static List<Deck> fromMapList(List<Map<String, dynamic>> decksMap) {
    var decks = decksMap.map((p) => fromMap(p)).toList();

    return decks;
  }

  Map<String, dynamic> toMap() {
    var deckMap = EntityAbstract.entityToMap(this);

    deckMap[dbTable.titleColumn] = this.title;
    deckMap[dbTable.descriptionColumn] = this.description;

    return deckMap;
  }
}
