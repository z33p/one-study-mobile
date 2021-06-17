import 'package:one_study_mobile/models/deck.dart';
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

    var decksMap = await repository.findBy(filter: deckFilter);

    var decks = Deck.fromMapList(decksMap);

    return decks;
  }

  Future<void> create(Deck deck) async {
    await repository.insert(deck);
  }
}
