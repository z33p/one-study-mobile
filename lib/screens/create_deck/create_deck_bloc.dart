import 'package:flutter/material.dart';
import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/create_deck/create_deck_state.dart';
import 'package:one_study_mobile/services/deck_service.dart';

class CreateDeckBloc {
  final CreateDeckState state;

  CreateDeckBloc(this.state);

  final _deckService = new DeckService();

  Future submitDeck(BuildContext context) async {
    if (!state.formKey.currentState!.validate()) return;

    var deck = Deck.make(
      title: state.inputTitleController.text,
      description: state.inputDescriptionController.text,
    );

    await _deckService.create(deck);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Deck created!"),
        duration: Duration(milliseconds: 2500),
      ),
    );
  }
}
