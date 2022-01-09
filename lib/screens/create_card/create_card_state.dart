import 'package:flutter/material.dart';
import 'package:one_study/models/deck.dart';
import 'package:one_study/models/card.dart' as Models;
import 'package:one_study/screens/shared/custom_providers/state_provider.dart';
import 'package:one_study/services/card_service.dart';
import 'package:one_study/services/deck_service.dart';

class CreateCardsState extends MyState {
  final _deckService = DeckService();
  final _cardService = CardService();

  final formKey = GlobalKey<FormState>();

  final inputFrontTextController = TextEditingController();
  final inputBackTextController = TextEditingController();

  final ValueNotifier<List<Deck>> decks = ValueNotifier(<Deck>[]);

  ValueNotifier<Deck?> deckSelected = ValueNotifier<Deck?>(null);

  final pageViewController = PageController(initialPage: 0);

  @override
  CreateCardsState createInstance() => CreateCardsState();

  queryDecks() async {
    decks.value = await _deckService.getDecks();
  }

  submitCard(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    var card = Models.Card.make(
      front: inputFrontTextController.text,
      back: inputBackTextController.text,
    );

    assert(deckSelected.value != null);

    await _cardService.create(
      card,
      attachDeckIdList: <int>[deckSelected.value!.deckId!],
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Card created"),
        duration: Duration(milliseconds: 2500),
      ),
    );
  }
}
