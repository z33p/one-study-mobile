import 'package:one_study_mobile/models/shared/entity_abstract.dart';
import 'package:one_study_mobile/models/tables/card_table.dart';

class Card extends EntityAbstract {
  int? cardId;

  final String front;
  final String back;

  double score = 0.5;

  Card({
    required this.cardId,
    required this.front,
    required this.back,
    required this.score,
    required createdAt,
    required updatedAt,
  }) : super(createdAt, updatedAt);

  Card.make({required this.front, required this.back, score}) : super.make();

  final CardTable dbTable = CardTable.instance;

  static Card fromMap(Map<String, dynamic> cardMap) {
    var cardTable = CardTable.instance;

    var card = Card(
      cardId: cardMap[cardTable.idColumn],
      front: cardMap[cardTable.frontColumn],
      back: cardMap[cardTable.backColumn],
      score: cardMap[cardTable.scoreColumn],
      createdAt: DateTime.parse(cardMap[EntityAbstract.createdAtColumn]),
      updatedAt: DateTime.parse(cardMap[EntityAbstract.updatedAtColumn]),
    );

    return card;
  }

  static List<Card> fromMapList(List<Map<String, dynamic>> cardsMap) {
    var cards = cardsMap.map((c) => fromMap(c)).toList();

    return cards;
  }

  Map<String, dynamic> toMap() {
    var cardMap = EntityAbstract.entityToMap(this);

    cardMap[dbTable.idColumn] = this.cardId;

    cardMap[dbTable.frontColumn] = this.front;
    cardMap[dbTable.backColumn] = this.back;

    cardMap[dbTable.scoreColumn] = this.score;

    return cardMap;
  }
}
