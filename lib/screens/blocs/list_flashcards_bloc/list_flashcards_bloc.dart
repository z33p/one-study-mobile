import 'dart:async';

import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/repositories/filters/cards/card_filter_builder.dart';
import 'package:one_study_mobile/repositories/repository.dart';

class ListFlashCardsBloc {
  final _repository = new Repository();

  ListFlashCardsBloc() {
    queryCards();
  }

  var cards = <Card>[];
  final _cardsStreamController = StreamController<List<Card>>();
  Stream<List<Card>> get cardsStream => _cardsStreamController.stream;

  queryCards() async {
    var cardsMap =
        await _repository.findBy(filter: CardFilterBuilder().build());

    cards = cardsMap
        .map(
          (cardMap) => Card.fromMap(cardMap),
        )
        .toList();

    _cardsStreamController.add(cards);
  }
}
