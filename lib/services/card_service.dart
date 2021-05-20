import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/repositories/filters/cards/card_filter.dart';
import 'package:one_study_mobile/repositories/filters/cards/card_filter_builder.dart';

import 'shared/service_abstract.dart';

class CardService extends ServiceAbstract {
  static final CardService _cardService = CardService._internal();

  factory CardService() {
    return _cardService;
  }

  CardService._internal();

  Future<List<Card>> getCards({CardFilter? cardFilter}) async {
    if (cardFilter == null) {
      cardFilter = CardFilterBuilder().build();
    }

    var cardsMap = await repository.findBy(filter: cardFilter);

    var cards = Card.fromMapList(cardsMap);

    return cards;
  }
}
