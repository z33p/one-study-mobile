import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/models/tables/card_deck_table.dart';
import 'package:one_study_mobile/repositories/filters/cards/card_filter.dart';
import 'package:one_study_mobile/repositories/filters/cards/card_filter_builder.dart';

import 'shared/service_abstract.dart';

enum CardScoreFeedbackEnum { BAD, GOOD, GREAT }

class CardService extends ServiceAbstract {
  static final CardService _cardService = CardService._internal();

  factory CardService() {
    return _cardService;
  }

  CardService._internal();

  Future<List<Card>> getCards({CardFilter? cardFilter}) async {
    if (cardFilter == null) cardFilter = CardFilterBuilder().build();

    var cards = await repository.findByMapped(
      filter: cardFilter,
      mapFunction: Card.fromMapList,
    );

    return cards;
  }

  Future<void> create(
    Card card, {
    List<int> attachDeckIdList = const [],
  }) async {
    card.cardId = await repository.insert(card);

    await repository.attach(
      pivotTable: CardDeckTable.instance,
      entity: card,
      attachIdList: attachDeckIdList,
    );
  }

  Future<void> setCardScore(
    CardScoreFeedbackEnum cardScoreFeedback,
    Card card,
  ) async {
    switch (cardScoreFeedback) {
      case CardScoreFeedbackEnum.BAD:
        var result = card.score * 0.95;
        card.setScore(result);
        break;

      case CardScoreFeedbackEnum.GOOD:
        card.setScore(card.score * 1.1);
        break;

      default:
        // GREAT
        card.setScore(card.score * 1.2);
    }

    await repository.update(card);
  }
}
