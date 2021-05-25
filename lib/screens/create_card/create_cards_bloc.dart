import 'package:flutter/material.dart'
    show BuildContext, ScaffoldMessenger, SnackBar, Text;
import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/screens/create_card/create_cards_state.dart';
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
    var card = new Card(
      front: state.inputFrontTextController.text,
      back: state.inputBackTextController.text,
    );

    await _cardService.createCard(card);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Card created"),
        duration: Duration(milliseconds: 2500),
      ),
    );
  }
}
