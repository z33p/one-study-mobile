import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/repositories/filters/cards/card_filter_builder.dart';
import 'package:one_study_mobile/repositories/filters/decks/deck_filter.dart';
import 'package:one_study_mobile/repositories/filters/decks/deck_filter_builder.dart';

import 'shared/service_abstract.dart';

class DeckService extends ServiceAbstract {
  static final DeckService _deckService = DeckService._internal();

  factory DeckService() {
    return _deckService;
  }

  DeckService._internal();

  Future<List<Deck>> getDecks({DeckFilter? deckFilter}) async {
    if (deckFilter == null) {
      deckFilter = DeckFilterBuilder().build();
    }

    var decks = await repository.findByMapped(
      filter: deckFilter,
      mapFunction: Deck.fromMapList,
    );

    return decks;
  }

  Future<void> create(Deck deck) async {
    await repository.insert(deck);
  }

  Future<Deck> generateInMemoryDeck() async {
    var cards = await repository.findByMapped(
      filter: CardFilterBuilder().setOrderBy((c) => c.scoreColumn).build(),
      mapFunction: Card.fromMapList,
    );

    var deck = Deck.make(
      title: "In Memory",
      description: "Deck in memory",
      cards: cards,
    );

    return deck;
  }
}
