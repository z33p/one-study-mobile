import 'package:flutter/material.dart'
    show BuildContext, ScaffoldMessenger, SnackBar, Text;
import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/screens/create_card/create_card_state.dart';
import 'package:one_study_mobile/services/card_service.dart';
import 'package:one_study_mobile/services/deck_service.dart';

class CreateCardsBloc {
  final _cardService = CardService();
  final _deckService = DeckService();

  final CreateCardsState state;

  CreateCardsBloc(this.state);

  queryDecks() async {
    final decks = await _deckService.getDecks();

    state.decks.value = decks;
  }

  submitCard(BuildContext context) async {
    if (!state.formKey.currentState!.validate()) return;

    var card = Card.make(
      front: state.inputFrontTextController.text,
      back: state.inputBackTextController.text,
    );

    var deckSelectedIdList = state.decksSelectedList
        .where((deckIdValueNotifier) => deckIdValueNotifier.value != null)
        .map((deckIdValueNotifier) => deckIdValueNotifier.value!)
        .toList();

    await _cardService.create(card, attachDeckIdList: deckSelectedIdList);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Card created"),
        duration: Duration(milliseconds: 2500),
      ),
    );
  }
}
