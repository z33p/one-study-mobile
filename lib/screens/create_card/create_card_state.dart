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

  List<ValueNotifier<int?>> decksSelectedList = <ValueNotifier<int?>>[];

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

    var deckSelectedIdList = decksSelectedList
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
