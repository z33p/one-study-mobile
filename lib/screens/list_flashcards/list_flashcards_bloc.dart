import 'dart:async';

import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/services/card_service.dart';

class ListFlashCardsBloc {
  final cardService = new CardService();

  ListFlashCardsBloc() {
    queryCards();
  }

  var cards = <Card>[];
  final _cardsStreamController = StreamController<List<Card>>();
  Stream<List<Card>> get cardsStream => _cardsStreamController.stream;

  queryCards() async {
    var cards = await cardService.getCards();

    _cardsStreamController.add(cards);
  }
}
