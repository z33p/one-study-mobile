import 'package:flutter/material.dart';
import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';
import 'package:one_study_mobile/services/deck_service.dart';

class CreateDeckState extends MyState {
    final _deckService = DeckService();

  final formKey = GlobalKey<FormState>();

  final inputTitleController = TextEditingController();
  final inputDescriptionController = TextEditingController();

  @override
  CreateDeckState createInstance() {
    var instance = new CreateDeckState();

    return instance;
  }

    Future submitDeck(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    var deck = Deck.make(
      title: inputTitleController.text,
      description: inputDescriptionController.text,
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
